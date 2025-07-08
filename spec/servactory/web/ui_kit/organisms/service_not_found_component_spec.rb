# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::ServiceNotFoundComponent, type: :component do
  it "renders the service not found message", :aggregate_failures do
    render_inline(described_class.new)

    # Check that the page header is rendered with the correct title and description
    expect(page).to have_css("h2", text: "Service Not Found")
    expect(page).to have_text("The requested service could not be found")

    # Check that the card is rendered with the correct message
    expect(page).to have_text("Service not found or source code could not be retrieved.")
  end

  it "applies custom class_name to the card" do
    render_inline(described_class.new(class_name: "custom-class"))

    # The class_name is applied to the CardComponent
    expect(page).to have_css(".custom-class")
  end

  it "applies custom options to the card" do
    render_inline(described_class.new(options: { data: { test: "value" } }))

    # The options are applied to the CardComponent
    expect(page).to have_css("[data-test='value']")
  end
end
