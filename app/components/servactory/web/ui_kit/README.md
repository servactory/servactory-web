# Servactory Web UI Kit

The UI Kit is a set of reusable ViewComponent-based components for building the Servactory Web interface. All components follow atomic design principles, are easy to extend, and cover the main UI needs of the project.

## Structure

- Each component consists of a Ruby class and a template (`.rb` + `.html.erb`).
- All components are located in `app/components/servactory/web/ui_kit`.
- Components are loosely coupled but can compose each other.
- **All components support `class_name:` for customizing TailwindCSS classes.**
- **Use only classes from TailwindCSS 4.1. Do not use custom classes.**
- **Do not use `options` unless you need to pass standard HTML attributes (e.g., aria-label).**

## Component List

### Atomic
- **IconComponent** — SVG icon (file, folder, custom). Example:
  ```erb
  <%= render IconComponent.new(type: :file) %>
  <%= render IconComponent.new(type: :custom, svg_path: 'M0...Z') %>
  ```
- **LinkComponent** — link with customizable options. Example:
  ```erb
  <%= render LinkComponent.new(href: '/docs', text: 'Docs', options: { class: 'text-blue-600' }) %>
  ```
- **ButtonComponent** — button with text and optional icon. Example:
  ```erb
  <%= render ButtonComponent.new(text: 'Save', icon_type: :file, class_name: 'shadow-lg') %>
  ```

### Typography
- **PageHeaderComponent** — page header with title and description. Example:
  ```erb
  <%= render PageHeaderComponent.new(title: 'Title', description: 'Desc') %>
  ```
- **SectionHeaderComponent** — section header with icon. Example:
  ```erb
  <%= render SectionHeaderComponent.new(title: 'Inputs', icon_type: :file, class_name: 'text-blue-600') %>
  ```

### Layout/Containers
- **CardComponent** — universal wrapper for sections/content. Example:
  ```erb
  <%= render CardComponent.new(class_name: 'shadow-lg') do %>
    ...content...
  <% end %>
  ```

### Navigation
- **NavbarComponent** — top navigation bar. Example:
  ```erb
  <%= render NavbarComponent.new(app_name: 'MyApp', app_url: '/', documentation_url: '/docs', github_url: 'https://github.com/...') %>
  ```
- **FooterComponent** — site footer. Example:
  ```erb
  <%= render FooterComponent.new(year: 2024, documentation_url: '/docs', github_url: 'https://github.com/...', version: '1.0.0', release_url: '/releases/1.0.0') %>
  ```

### Service Tree
- **TreeComponent** — wrapper for the service tree. Example:
  ```erb
  <%= render TreeComponent.new(nodes: @services_tree) %>
  ```
- **TreeNodeComponent** — recursive tree node (used internally by TreeComponent).

### Specialized
- **CodeBlockComponent** — code block with copy button. Example:
  ```erb
  <%= render CodeBlockComponent.new(code: 'def foo; end', language: 'ruby', copy_button: true) %>
  ```

## Best Practices
- Use components for any repeated markup.
- For complex sections, compose components (e.g., Card + SectionHeader + Button).
- Use IconComponent for SVG icons; do not inline SVG directly.
- Always use LinkComponent for links to ensure consistent styles and aria attributes.
- Follow the style and structure of the UI Kit when adding new components.
- **Use `class_name:` to customize the appearance of components only with TailwindCSS classes.**
- **Use only classes from TailwindCSS 4.1. Do not use custom classes.**
- **Do not use `options` unless you need to pass standard HTML attributes (e.g., aria-label).**

## How to Add a New Component
1. Create a Ruby class and template in this directory.
2. Use the ViewComponent API (`< ComponentName < ViewComponent::Base`).
3. Add a description and example to this README.
4. Cover the component with tests (recommended).
