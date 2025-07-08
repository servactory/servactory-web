# Servactory Web UI Kit

The UI Kit is a set of reusable [ViewComponent](https://viewcomponent.org/) components for the Servactory Web interface. All components are built according to atomic design principles (atoms, molecules, organisms), are easy to extend, and cover the main UI needs of the project.

## Atomic Design & Folder Structure

- **Atoms** — basic elements (buttons, icons, badges, links). Located in `app/components/servactory/web/ui_kit/atoms/`.
- **Molecules** — simple compositions of atoms (section headers, list items, containers). Located in `app/components/servactory/web/ui_kit/molecules/`.
- **Organisms** — complex blocks combining molecules and atoms (cards, lists, service tree, navigation). Located in `app/components/servactory/web/ui_kit/organisms/`.

All components inherit from `ViewComponent::Base`.

**All components support the `class_name:` parameter for customizing with TailwindCSS utility classes.**
**To pass standard HTML attributes, use the `options:` parameter (e.g., aria-label, data-*, target, etc.).**
**Use only TailwindCSS 4.1 utility classes. Do not add custom CSS classes.**

---

## Atoms

### IconComponent
SVG icon (file, folder, etc.).
```erb
<%= render IconComponent.new(name: :file, class_name: 'w-6 h-6 text-blue-500') %>
```
**Parameters:**
- `name:` — icon name (`:file`, `:folder`, `:inputs`, `:internals`, `:outputs`, `:actions`, `:code`, `:copy`, `:stack`)
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

### ColoredSectionHeaderComponent
Colored section header with a left border.
```erb
<%= render ColoredSectionHeaderComponent.new(
  title: 'Inputs',
  border_class: 'border-blue-500',
  bg_class: 'bg-blue-100/60',
  text_class: 'text-blue-700',
  class_name: 'mb-2',
  options: { id: 'inputs-header' }
) %>
```
**Parameters:**
- `title:` — header text
- `border_class:` — utility class for left border
- `bg_class:` — utility class for background
- `text_class:` — utility class for text
- `class_name:` — additional utility classes
- `options:` — standard HTML attributes

### CopyButtonComponent
Button for copying code.
```erb
<%= render CopyButtonComponent.new(code: 'def foo; end', options: { id: 'copy-btn' }) %>
```
**Parameters:**
- `code:` — code to copy
- `options:` — standard HTML attributes

### CardHeaderTextComponent
Header for cards and sections.
```erb
<%= render CardHeaderTextComponent.new(text: 'My Title', class_name: 'mb-2', options: { id: 'header' }) %>
```
**Parameters:**
- `text:` — header
- `class_name:` — TailwindCSS utility classes
- `options:` — standard HTML attributes

### EmptyStateComponent
Empty state for lists.
```erb
<%= render EmptyStateComponent.new(message: 'No data', class_name: 'mt-4', options: { id: 'empty' }) %>
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
<%= render SectionHeaderComponent.new(title: 'Inputs', icon_name: :file, class_name: 'text-blue-600', options: { id: 'inputs-section' }) %>
```
**Parameters:**
- `title:` — header text
- `icon_name:` — icon name (see IconComponent)
- `class_name:` — utility classes
- `options:` — HTML attributes

### AttributeSectionComponent
Section with colored header and attribute list.
```erb
<%= render AttributeSectionComponent.new(
  title: 'Inputs',
  items: @inputs,
  border_class: 'border-blue-500',
  text_class: 'text-blue-700',
  bg_class: 'bg-blue-100/60',
  empty_message: 'No input attributes',
  class_name: 'mb-4',
  options: { id: 'inputs-section' }
) %>
```
**Parameters:**
- `title:` — section title
- `items:` — attributes to display
- `border_class:` — utility class for left border
- `bg_class:` — utility class for background
- `text_class:` — utility class for text
- `empty_message:` — message to display when no items
- `class_name:` — additional utility classes
- `options:` — standard HTML attributes

### AttributeItemComponent
Attribute list item (name, required/optional, description).
```erb
<%= render AttributeItemComponent.new(name: 'user_id', border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', attribute: attr_obj, class_name: 'mb-2', options: { id: 'user-id-attr' }) do %>
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

### CardBodyComponent
Container for card body content.
```erb
<%= render CardBodyComponent.new(class_name: 'p-4', options: { id: 'card-body' }) do %>
  ...
<% end %>
```
**Parameters:**
- `class_name:` — utility classes
- `options:` — standard HTML attributes

### CardBodyContainerComponent
Internal container for card body.
```erb
<%= render CardBodyContainerComponent.new(class_name: 'p-4', options: { id: 'body-container' }) do %>
  ...
<% end %>
```
**Parameters:**
- `class_name:` — utility classes
- `options:` — standard HTML attributes

### CardContainerComponent
Container for card content.
```erb
<%= render CardContainerComponent.new(class_name: 'shadow', options: { id: 'container' }) do %>
  ...
<% end %>
```
**Parameters:**
- `class_name:` — utility classes
- `options:` — standard HTML attributes

### CardHeaderComponent
Card header, supports a `right` slot for actions.
```erb
<%= render CardHeaderComponent.new(text: 'Header', class_name: 'bg-gray-50', options: { id: 'header' }) do |header| %>
  <% header.right do %>
    ...actions...
  <% end %>
<% end %>
```
**Parameters:**
- `text:` — header text
- `class_name:` — utility classes
- `options:` — standard HTML attributes
- `right` slot for actions

---

## Organisms

### CardComponent
Universal container for sections/content. Supports a `header` slot.
```erb
<%= render CardComponent.new(class_name: 'shadow-lg', options: { id: 'main-card' }) do |card| %>
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
Section card with header, icon, and attribute list (inputs, outputs, actions, etc.).
```erb
<%= render SectionCardComponent.new(title: 'Inputs', items: @items, border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', icon_name: :inputs, empty_message: 'No input attributes', class_name: 'mb-4', options: { id: 'inputs-section-card' }) %>
```
**Parameters:**
- `title:`, `items:`, `border_class:`, `text_class:`, `bg_class:`, `icon_name:`, `empty_message:`, `class_name:`, `options:`
- `body` slot for additional content

### AttributeListComponent
List of attributes (inputs, outputs, internals, actions).
```erb
<%= render AttributeListComponent.new(items: @items, border_class: 'border-blue-500', text_class: 'text-blue-700', bg_class: 'bg-blue-50', empty_message: 'No attributes', class_name: 'mb-2', options: { id: 'attr-list' }) %>
```
**Parameters:**
- `items:` — attributes hash
- `border_class:`, `text_class:`, `bg_class:` — utility classes
- `empty_message:` — message if no items
- `class_name:`, `options:`

### CodeBlockComponent
Block with source code and copy button.
```erb
<%= render CodeBlockComponent.new(code: 'def foo; end', language: 'ruby', copy_button: true) %>
```
**Parameters:**
- `code:`, `language:`, `copy_button:`

### AttributesBlockComponent
Block containing multiple attribute sections (inputs, internals, outputs).
```erb
<%= render AttributesBlockComponent.new(
  inputs: @inputs,
  internals: @internals,
  outputs: @outputs,
  class_name: 'mb-4',
  options: { id: 'attr-block' }
) %>
```
**Parameters:**
- `inputs:` — input attributes
- `internals:` — internal attributes
- `outputs:` — output attributes
- `class_name:` — additional utility classes
- `options:` — standard HTML attributes
- Conditional rendering: only renders if at least one attribute group is present

### ServiceDetailsComponent
Complete service details page with header, attributes, actions, and code.
```erb
<%= render ServiceDetailsComponent.new(
  service_class: @service_class,
  source_code: @source_code,
  class_name: 'mb-4',
  options: { id: 'service-details' }
) %>
```
**Parameters:**
- `service_class:` — service class object
- `source_code:` — service source code
- `class_name:` — additional utility classes
- `options:` — standard HTML attributes
- Conditional rendering: only renders if both service_class and source_code are present

### ServiceNotFoundComponent
Service not found page.
```erb
<%= render ServiceNotFoundComponent.new(class_name: 'mb-4', options: { id: 'not-found' }) %>
```
**Parameters:**
- `class_name:` — additional utility classes
- `options:` — standard HTML attributes

### TreeComponent
Service tree (service navigation).
```erb
<%= render TreeComponent.new(nodes: @services_tree, route_type: :internal, class_name: 'mb-4', options: { id: 'tree' }) %>
```
**Parameters:**
- `nodes:` — array of tree nodes
- `route_type:` — :internal or :external
- `gem_name:` — (optional) gem name for external tree
- `class_name:`, `options:`

### TreeNodeComponent
Single node in the service tree. Used internally by TreeComponent.
**Parameters:**
- `node:` — node hash
- `route_type:` — :internal or :external
- `level:` — (optional) tree depth
- `gem_name:` — (optional) gem name

### NavbarComponent
Top navigation bar.
```erb
<%= render NavbarComponent.new(app_name: 'MyApp', app_url: '/', documentation_url: '/docs', github_url: 'https://github.com/...') %>
```
**Parameters:**
- `app_name:` — application name
- `app_url:` — (optional) application URL
- `documentation_url:` — docs URL
- `github_url:` — GitHub URL

### FooterComponent
Site footer.
```erb
<%= render FooterComponent.new(year: 2024, documentation_url: '/docs', github_url: 'https://github.com/...', version: '1.0.0', release_url: '/releases/1.0.0') %>
```
**Parameters:**
- `year:` — copyright year
- `documentation_url:` — docs URL
- `github_url:` — GitHub URL
- `version:` — version string
- `release_url:` — release URL

### PageHeaderComponent
Page header with description.
```erb
<%= render PageHeaderComponent.new(title: 'Title', description: 'Desc') %>
```
**Parameters:**
- `title:` — page title
- `description:` — (optional) description

### SubnavigationComponent
Navigation bar for switching between Application and Gem services.
```erb
<%= render SubnavigationComponent.new(gem_names: ["my_gem", "other_gem"], active_gem_name: params[:gem_name], class_name: 'mb-4', options: { id: 'subnav' }) %>
```
**Parameters:**
- `gem_names:` — array of gem names
- `active_gem_name:` — (optional) the gem name from params to highlight the active link
- `class_name:` — TailwindCSS utility classes
- `options:` — standard HTML attributes
- Conditional rendering: only renders if gem_names are present

The active link is highlighted with `text-blue-600 font-semibold`.

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
