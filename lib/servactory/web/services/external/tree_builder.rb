# frozen_string_literal: true

module Servactory
  module Web
    module Services
      module External
        # Builds a tree structure of service classes for UI display (gems only)
        class TreeBuilder
          GEM_NAMES = Servactory::Web.configuration.gem_names
          GEM_SERVICE_DIRECTORIES = Servactory::Web.configuration.gem_service_directories

          def self.build(gem)
            new(gem).build
          end

          def initialize(gem)
            @gem = gem
          end

          def build
            services = ServiceFileCollector.collect_service_files_for_gem(@gem)
            TreeConstructor.build_tree(services)
          end

          def self.class_name_from_path(path, base_path)
            PathConverter.class_name_from_path(path, base_path)
          end

          def self.find_service(gem, service_path)
            new(gem).find_service(service_path)
          end

          def find_service(service_path) # rubocop:disable Metrics/MethodLength
            service_path = service_path.to_s.gsub(%r{^services/?}, "").sub(%r{^/+}, "")
            gem_root = Pathname.new(@gem.gem_dir)

            found = GEM_SERVICE_DIRECTORIES.find do |subdir|
              base_path = gem_root.join(subdir)
              file_path = base_path.join("#{service_path}.rb")
              if file_path.exist?
                return {
                  base_path:,
                  file_path:,
                  service_class: load_service_class(file_path, base_path),
                  source_code: load_source_code(file_path)
                }
              end
              false
            end

            return if found

            {
              base_path: nil,
              file_path: nil,
              service_class: nil,
              source_code: nil
            }
          end

          private

          def load_service_class(file_path, base_path)
            class_name = PathConverter.class_name_from_path(file_path, base_path)
            class_name.safe_constantize
          end

          def load_source_code(file_path)
            File.read(file_path) if File.exist?(file_path)
          end

          class PathConverter
            def self.class_name_from_path(path, base_path)
              rel_path = path.relative_path_from(base_path).to_s
              rel_path.chomp!(".rb")
              rel_path.split("/").map(&:camelize).join("::")
            end

            def self.extract_display_name(pathname, base_path)
              pathname.relative_path_from(base_path)
                      .to_s
                      .chomp(".rb")
                      .split("/")
                      .last
                      .camelize
            end
          end

          class ServiceClassVerifier
            def self.service_class?(class_name)
              service_class = class_name.safe_constantize
              return false unless service_class.is_a?(Class)
              return false unless service_class.respond_to?(:servactory?)

              service_class.servactory?
            rescue StandardError
              false
            end
          end

          class ServiceFileCollector
            def self.collect_service_files_for_gem(gem)
              gem_root = Pathname.new(gem.gem_dir)

              GEM_SERVICE_DIRECTORIES.flat_map do |subdir|
                collect_services_from_gem_subdir(gem_root, subdir)
              end.flatten
            rescue Gem::LoadError, Gem::MissingSpecError # rubocop:disable Lint/ShadowedException
              []
            end

            def self.collect_services_from_gem_subdir(gem_root, subdir) # rubocop:disable Metrics/MethodLength
              base_path = gem_root.join(subdir)
              return [] unless base_path.exist?

              Dir.glob(base_path.join("**", "*.rb")).filter_map do |file|
                pathname = Pathname.new(file)
                class_name = PathConverter.class_name_from_path(pathname, base_path)
                next unless ServiceClassVerifier.service_class?(class_name)

                {
                  path: pathname.relative_path_from(base_path).to_s,
                  class_name:,
                  display_name: PathConverter.extract_display_name(pathname, base_path)
                }
              end
            end
          end

          class TreeConstructor
            def self.build_tree(services)
              build_tree_from_paths(services)
            end

            def self.build_tree_from_paths(services, parent_path = "") # rubocop:disable Metrics/MethodLength
              grouped_services = services.group_by { |s| s[:path].split("/").first }
              directories = []
              files = []

              grouped_services.each do |key, group|
                path_parts = group.map { |s| s[:path].split("/") }

                if contains_only_files?(path_parts)
                  files.concat(process_files(group, parent_path))
                else
                  directories << process_directory(key, group, parent_path)
                end
              end

              sort_and_combine(directories, files)
            end

            def self.contains_only_files?(path_parts)
              path_parts.all? { |parts| parts.size == 1 }
            end

            def self.process_files(group, parent_path)
              group.map do |service|
                full_path = File.join(parent_path, service[:path])
                {
                  name: service[:display_name],
                  type: "file",
                  path: "services/#{full_path}"
                }
              end
            end

            def self.process_directory(key, group, parent_path)
              children_services = extract_children_services(group)

              {
                name: key.camelize,
                type: "directory",
                children: build_tree_from_paths(children_services, File.join(parent_path, key))
              }
            end

            def self.extract_children_services(group)
              group.filter_map do |service|
                parts = service[:path].split("/")
                next if parts.size == 1

                {
                  path: parts[1..].join("/"),
                  class_name: service[:class_name],
                  display_name: service[:display_name]
                }
              end
            end

            def self.sort_and_combine(directories, files)
              directories.sort_by! { |h| h[:name] }
              files.sort_by! { |h| h[:name] }
              directories + files
            end
          end
        end
      end
    end
  end
end
