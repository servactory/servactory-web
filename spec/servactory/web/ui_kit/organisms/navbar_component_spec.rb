# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::NavbarComponent, type: :component do
  let(:app_name) { "MyApp" }
  let(:documentation_url) { "https://servactory.com" }
  let(:github_url) { "https://github.com/servactory/servactory" }
  let(:app_url) { "/app" }

  it "renders navbar with app name as link if app_url is present", :aggregate_failures do
    render_inline(
      described_class.new(
        app_name:,
        documentation_url:,
        github_url:,
        app_url:
      )
    )
    expect(page).to have_link(app_name, href: app_url)
    expect(page).to have_link("Documentation", href: documentation_url)
    expect(page).to have_link("GitHub", href: github_url)
  end

  it "renders navbar with app name as text if app_url is not present", :aggregate_failures do
    render_inline(described_class.new(app_name:, documentation_url:, github_url:))
    expect(page).to have_text(app_name)
    expect(page).to have_link("Documentation", href: documentation_url)
    expect(page).to have_link("GitHub", href: github_url)
  end
end
