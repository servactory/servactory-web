# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::AttributeListComponent, type: :component do
  it "renders attribute items with correct classes", :aggregate_failures do
    items = {
      "user_id" => { types: [String], description: "User ID" },
      "age" => { types: [Integer], description: "Age" }
    }
    render_inline(
      described_class.new(
        items:,
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        empty_message: "No attributes"
      )
    )
    expect(page).to have_text("user_id")
    expect(page).to have_text("age")
    expect(page).to have_text("User ID")
    expect(page).to have_text("Age")
    expect(page).to have_css(".border-blue-500")
    expect(page).to have_css(".text-blue-700")
    expect(page).to have_css(".bg-blue-50")
  end

  it "renders nothing if items are empty" do
    render_inline(
      described_class.new(
        items: {},
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        empty_message: "No attributes"
      )
    )
    expect(page).to have_no_text("No attributes") # Empty state is not rendered here, only in SectionCardComponent
  end
end
