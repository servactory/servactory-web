# frozen_string_literal: true

module Servactory
  module Web
    module Services
      # Builds a tree structure of service classes for UI display
      class TreeBuilder
        SERVICES_PATH = Rails.root.join("app/services")
        SERVICE_BASE_CLASS = ApplicationService::Servactory::Base

        # Builds the complete service tree
        #
        # @return [Array<Hash>] Tree structure of services
        def self.build
          new.build
        end

        # Finds a service class by name
        #
        # @param name [String] The class name to find
        # @return [Class, nil] The service class or nil if not found
        def self.find_service_class(name)
          name.safe_constantize
        end

        # Converts a file path to a class name
        #
        # @param path [Pathname] File path
        # @return [String] Class name
        def self.class_name_from_path(path)
          new.class_name_from_path(path)
        end

        # Builds the complete service tree
        #
        # @return [Array<Hash>] Tree structure of services
        def build
          build_tree_from_paths(collect_service_files)
        end

        # Converts a file path to a class name
        #
        # @param path [Pathname] File path
        # @return [String] Class name
        def class_name_from_path(path)
          rel_path = path.relative_path_from(SERVICES_PATH).to_s
          rel_path.chomp!(".rb")
          rel_path.split("/").map(&:camelize).join("::")
        end

        private

        # Collects all service files and their metadata
        #
        # @return [Array<Hash>] List of service files with metadata
        def collect_service_files # rubocop:disable Metrics/MethodLength
          service_files = Dir.glob(SERVICES_PATH.join("**", "*.rb"))

          service_files.filter_map do |file|
            pathname = Pathname.new(file)
            class_name = class_name_from_path(pathname)

            next unless service_class?(class_name)

            {
              path: pathname.relative_path_from(SERVICES_PATH).to_s,
              class_name:,
              display_name: extract_display_name(pathname)
            }
          end
        end

        # Extracts display name from file path
        #
        # @param pathname [Pathname] File path
        # @return [String] Display name for the service
        def extract_display_name(pathname)
          pathname.relative_path_from(SERVICES_PATH)
                  .to_s
                  .chomp(".rb")
                  .split("/")
                  .last
                  .camelize
        end

        # Builds a tree structure from service paths
        #
        # @param services [Array<Hash>] List of services with metadata
        # @param parent_path [String] Parent path for nested services
        # @return [Array<Hash>] Tree structure of services
        def build_tree_from_paths(services, parent_path = "") # rubocop:disable Metrics/MethodLength
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

        # Checks if all paths represent files (no subdirectories)
        #
        # @param path_parts [Array<Array<String>>] Path parts
        # @return [Boolean] True if all paths are files
        def contains_only_files?(path_parts)
          path_parts.all? { |parts| parts.size == 1 }
        end

        # Processes file entries
        #
        # @param group [Array<Hash>] Group of services
        # @param parent_path [String] Parent path
        # @return [Array<Hash>] File entries
        def process_files(group, parent_path)
          group.map do |service|
            full_path = File.join(parent_path, service[:path])
            {
              name: service[:display_name],
              type: "file",
              path: "services/#{full_path}"
            }
          end
        end

        # Processes directory entries
        #
        # @param key [String] Directory name
        # @param group [Array<Hash>] Group of services
        # @param parent_path [String] Parent path
        # @return [Hash] Directory entry with children
        def process_directory(key, group, parent_path)
          children_services = extract_children_services(group)

          {
            name: key.camelize,
            type: "directory",
            children: build_tree_from_paths(children_services, File.join(parent_path, key))
          }
        end

        # Extracts children services from a group
        #
        # @param group [Array<Hash>] Group of services
        # @return [Array<Hash>] Children services
        def extract_children_services(group)
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

        # Sorts and combines directories and files
        #
        # @param directories [Array<Hash>] Directory entries
        # @param files [Array<Hash>] File entries
        # @return [Array<Hash>] Combined and sorted entries
        def sort_and_combine(directories, files)
          directories.sort_by! { |h| h[:name] }
          files.sort_by! { |h| h[:name] }
          directories + files
        end

        # Checks if a class is a service class
        #
        # @param class_name [String] Class name to check
        # @return [Boolean] True if it's a service class
        def service_class?(class_name)
          klass = class_name.safe_constantize
          klass && klass < SERVICE_BASE_CLASS
        rescue NameError
          false
        end
      end
    end
  end
end
