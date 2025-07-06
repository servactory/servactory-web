# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::FooterComponent, type: :component do
  let(:year) { 2024 }
  let(:documentation_url) { "https://servactory.com" }
  let(:github_url) { "https://github.com/servactory/servactory" }
  let(:version) { "1.0.0" }
  let(:release_url) { "https://github.com/servactory/servactory/releases/tag/v1.0.0" }

  it "renders footer with year, documentation, github, and version links", :aggregate_failures do
    render_inline(
      described_class.new(
        year:,
        documentation_url:,
        github_url:,
        version:,
        release_url:
      )
    )
    expect(page).to have_text("© #{year} Servactory")
    expect(page).to have_link("Documentation", href: documentation_url)
    expect(page).to have_link("GitHub", href: github_url)
    expect(page).to have_link("Servactory #{version}", href: release_url)
    expect(page).to have_css(".font-mono.text-xs.bg-gray-200.text-gray-800")
  end
end
