<p align="center">
  <a href="https://servactory.com" target="_blank">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/servactory/servactory/main/.github/logo-dark.svg">
      <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/servactory/servactory/main/.github/logo-light.svg">
      <img alt="Servactory Web" src="https://raw.githubusercontent.com/servactory/servactory/main/.github/logo-light.svg" width="350" height="70" style="max-width: 100%;">
    </picture>
  </a>
</p>
<p align="center">
  <a href="https://rubygems.org/gems/servactory-web"><img src="https://img.shields.io/gem/v/servactory-web?logo=rubygems&logoColor=fff" alt="Gem version"></a>
  <a href="https://github.com/servactory/servactory-web/releases"><img src="https://img.shields.io/github/release-date/servactory/servactory-web" alt="Release Date"></a>
</p>

## Purpose

Servactory Web provides a beautiful web interface for exploring and visualizing your Servactory services in Rails applications. It allows you to:

- Browse all services in your application in a hierarchical tree view
- View detailed information about each service, including inputs, internals, and outputs
- Examine the source code of each service
- Understand the structure and implementation of your services at a glance

This UI makes it easier to understand, debug, and document your Servactory services, especially in large applications with many services.

## Quick Start

### Installation

Add this line to your application's Gemfile:

```ruby
gem "servactory-web"
```

And then execute:

```bash
bundle install
```

### Setup

Mount the Servactory Web engine in your Rails application's routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Servactory::Web::Engine => "/servactory" unless Rails.env.production?
end
```

For security reasons, this engine should not be used in production environments.

### Configuration

Create an initializer to configure Servactory Web:

```ruby
# config/initializers/servactory_web.rb
Servactory::Web.configure do |config|
  # The name of your application (optional)
  config.app_name = "My Application"

  # The URL of your application (optional)
  config.app_url = "https://myapp.example.com"

  # The directory where your services are located (default: "app/services")
  config.app_services_directory = "app/services"
end
```

## Usage

After installation and configuration, navigate to `/servactory` in your browser to access the Servactory Web interface.

### Services List

The main page displays a hierarchical tree of all services in your application, organized by namespace. Click on any service to view its details.

### Service Details

The service details page provides comprehensive information about a specific service:

- **Inputs**: All input attributes with their types, validations, and other options
- **Internals**: All internal attributes with their types and options
- **Outputs**: All output attributes with their types and options
- **Actions**: All actions defined in the service with their options
- **Source Code**: The complete implementation of the service

This view makes it easy to understand what a service does, what it requires, and what it produces, without having to navigate through multiple files.

## Example

For a service defined like this:

```ruby
class Users::CreateService < ApplicationService::Base
  input :email, type: String
  input :password, type: String
  input :name, type: String, required: false
  
  output :user, type: User
  output :token, type: String

  make :create_user!
  make :generate_token!

  private

  def create_user!
    outputs.user = User.create!(
      email: inputs.email,
      password: inputs.password,
      name: inputs.name
    )
  end

  def generate_token!
    outputs.token = TokenGeneratorService.call!(user: outputs.user)
  end
end
```

Servactory Web will display a detailed view showing all inputs, internals, outputs, and the source code, making it easy to understand the service's functionality at a glance.

## Contributing

This project is intended to be a safe, welcoming space for collaboration.
Contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
We recommend reading the [contributing guide](./CONTRIBUTING.md) as well.

## License

Featury is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
