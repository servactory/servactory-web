# Servactory Web UI Kit

The UI Kit is a set of reusable ViewComponent-based components for the Servactory Web interface. All components are built according to atomic design principles (atoms, molecules, organisms), are easy to extend, and cover the main UI needs of the project.

## Atomic Design

- **Atoms** — basic elements (buttons, icons, badges, links).
- **Molecules** — simple compositions of atoms (section headers, list items, containers).
- **Organisms** — complex blocks combining molecules and atoms (cards, lists, service tree, navigation).

## General Rules

- Each component consists of a Ruby class and a template (`.rb` + `.html.erb`).
- All components are located in `app/components/servactory/web/ui_kit` according to atomic design.
- **All components support the `class_name:` parameter for customizing with TailwindCSS utility classes.**
- **To pass standard HTML attributes, use the `options:` parameter (e.g., aria-label, data-*, target, etc.).**
- **Use only TailwindCSS 4.1 utility classes. Do not add custom CSS classes.**
- Do not use `options` unless you need to pass standard HTML attributes.

---

## Atoms

### IconComponent
SVG icon (file, folder, etc.).
```erb
<%= render IconComponent.new(name: :file, class_name: 'w-6 h-6 text-blue-500') %>
```
**Parameters:**
- `name:` — icon name (`:file`, `:folder`, `:inputs`, `:internals`, `:outputs`, `:actions`, `:code`, `:custom`)
- `class_name:` — TailwindCSS utility classes for the SVG element (required: always specify size and color)

### LinkComponent
Customizable link.
```erb
<%= render LinkComponent.new(href: '/docs', text: 'Docs', options: { class: 'text-blue-600', target: '_blank' }) %>
```
**Parameters:**
- `href:` — URL
- `text:` — link text
- `options:` — standard HTML attributes and classes

### BadgeComponent
Badge with text, can be used for required/optional indicators.
```erb
<%= render BadgeComponent.new(text: 'Username', class_name: 'mb-2') %>
<%= render BadgeComponent.new(text: 'required', class_name: 'text-xs bg-gray-100 px-2 py-1 rounded text-gray-600') %>
```
**Parameters:**
- `text:` — badge text
- `class_name:` — TailwindCSS utility classes

### CopyButtonComponent
Button for copying code.
```erb
<%= render CopyButtonComponent.new(code: 'def foo; end') %>
```

### CardHeaderTextComponent
Заголовок для карточек и секций.
```erb
<%= render CardHeaderTextComponent.new(text: 'My Title', class_name: 'mb-2') %>
```
**Parameters:**
- `text:` — заголовок
- `class_name:` — TailwindCSS utility classes
- `options:` — стандартные HTML-атрибуты

### EmptyStateComponent
Empty state for lists.
```erb
<%= render EmptyStateComponent.new(message: 'No data') %>
```
**Parameters:**
- `message:` — message to display
- `class_name:` — TailwindCSS utility classes
- `options:` — standard HTML attributes

---

## Molecules

### SectionHeaderComponent
Section header with icon.
```erb
<%= render SectionHeaderComponent.new(title: 'Inputs', icon_name: :file, class_name: 'text-blue-600') %>
```
**Parameters:**
- `title:` — header text
- `icon_name:` — icon name (see IconComponent)
- `class_name:` — utility classes
- `options:` — HTML attributes

### AttributeItemComponent
Attribute list item (name, required/optional, description).
```erb
<%= render AttributeItemComponent.new(name: 'user_id', border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', attribute: attr_obj) do %>
  ...
<% end %>
```
**Parameters:**
- `name:` — attribute name
- `border_class:` — utility class for left border
- `text_class:` — utility class for text
- `bg_class:` — utility class for background
- `attribute:` — attribute object (determines required)
- `class_name:`, `options:`

### CardBodyComponent / CardBodyContainerComponent / CardContainerComponent
Internal containers for cards, support customization via class_name and options.

### CardHeaderComponent
Card header, supports customization.

---

## Organisms

### CardComponent
Universal container for sections/content.
```erb
<%= render CardComponent.new(class_name: 'shadow-lg') do |card| %>
  <% card.with_header do %>
    ...
  <% end %>
  ...content...
<% end %>
```
**Parameters:**
- `class_name:`, `options:`
- `header` slot for the header

### SectionCardComponent
Section card with header, icon, and attribute list (inputs, outputs, actions, etc.). Composes CardComponent, SectionHeaderComponent, AttributeListComponent.
```erb
<%= render SectionCardComponent.new(title: 'Inputs', items: {...}, border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', icon_name: :inputs, empty_message: 'No input attributes') %>
```
**Parameters:**
- `title:`, `items:`, `border_class:`, `text_class:`, `bg_class:`, `icon_name:`, `empty_message:`, `class_name:`, `options:`

### AttributeListComponent
List of attributes (inputs, outputs, internals, actions).
```erb
<%= render AttributeListComponent.new(items: {...}, border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', empty_message: 'No attributes') %>
```

### CodeBlockComponent
Block with source code and copy button.
```erb
<%= render CodeBlockComponent.new(code: 'def foo; end', language: 'ruby', copy_button: true) %>
```
**Parameters:**
- `code:`, `language:`, `copy_button:`

### TreeComponent / TreeNodeComponent
Service tree (service navigation).
```erb
<%= render TreeComponent.new(nodes: @services_tree) %>
```

### NavbarComponent
Top navigation bar.
```erb
<%= render NavbarComponent.new(app_name: 'MyApp', app_url: '/', documentation_url: '/docs', github_url: 'https://github.com/...') %>
```

### FooterComponent
Site footer.
```erb
<%= render FooterComponent.new(year: 2024, documentation_url: '/docs', github_url: 'https://github.com/...', version: '1.0.0', release_url: '/releases/1.0.0') %>
```

### PageHeaderComponent
Page header with description.
```erb
<%= render PageHeaderComponent.new(title: 'Title', description: 'Desc') %>
```

---

## Best Practices
- Use components for any repeated markup.
- For complex sections, compose components (e.g., Card + SectionHeader).
- Use IconComponent for SVG icons only.
- Always use LinkComponent for links for consistency and accessibility.
- Use only the `class_name:` parameter for custom utility classes.
- Use only the `options:` parameter for standard HTML attributes.
- Do not add custom CSS classes.
- Follow atomic design when adding new components.

## How to add a new component
1. Create a Ruby class and template in the appropriate folder (atoms, molecules, organisms).
2. Use the ViewComponent API (`< ComponentName < ViewComponent::Base`).
3. Add a description and example to this README.
4. All testing must be done using RSpec.
