# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::AttributeSectionComponent, type: :component do
  let(:items) do
    {
      "user_id" => { types: [String], description: "User ID" },
      "age" => { types: [Integer], description: "Age" }
    }
  end

  it "renders the title and items", :aggregate_failures do
    render_inline(
      described_class.new(
        title: "Test Section",
        items:,
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700"
      )
    )

    # Check that the title is rendered
    expect(page).to have_text("Test Section")

    # Check that the items are rendered
    expect(page).to have_text("user_id")
    expect(page).to have_text("age")
    expect(page).to have_text("User ID")
    expect(page).to have_text("Age")

    # Check that the styling classes are applied
    expect(page).to have_css(".border-blue-500")
    expect(page).to have_css(".bg-blue-100")
    expect(page).to have_css(".text-blue-700")
  end

  it "applies custom class_name" do
    render_inline(
      described_class.new(
        title: "Test Section",
        items:,
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700",
        class_name: "custom-class"
      )
    )
    expect(page).to have_css("div.custom-class")
  end

  it "applies custom options", :aggregate_failures do
    render_inline(
      described_class.new(
        title: "Test Section",
        items:,
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700",
        options: { class: "options-class", data: { test: "value" } }
      )
    )
    expect(page).to have_css("div.options-class")
    expect(page).to have_css("div[data-test='value']")
  end

  it "handles empty items with empty_message" do
    render_inline(
      described_class.new(
        title: "Empty Section",
        items: {},
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700",
        empty_message: "No items available"
      )
    )

    # The title should still be rendered
    expect(page).to have_text("Empty Section")

    # The empty message is not directly rendered by this component,
    # but passed to the AttributeListComponent
  end
end
