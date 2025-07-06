# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::SectionCardComponent, type: :component do
  let(:items) do
    {
      "user_id" => { types: [String], description: "User ID" },
      "age" => { types: [Integer], description: "Age" }
    }
  end

  it "renders section card with items and header", :aggregate_failures do
    render_inline(
      described_class.new(
        title: "Inputs",
        items:,
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        icon_name: :inputs,
        empty_message: "No attributes"
      )
    )
    expect(page).to have_text("Inputs")
    expect(page).to have_text("user_id")
    expect(page).to have_text("User ID")
    expect(page).to have_css(".border-blue-500")
    expect(page).to have_css(".text-blue-700")
    expect(page).to have_css(".bg-blue-50")
    expect(page).to have_css("svg.size-6.text-blue-600")
  end

  it "renders empty state if items are empty" do
    render_inline(
      described_class.new(
        title: "Empty",
        items: {},
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        icon_name: :inputs,
        empty_message: "No attributes"
      )
    )
    expect(page).to have_text("No attributes")
  end

  it "applies custom class_name and options" do
    render_inline(
      described_class.new(
        title: "Styled",
        items:,
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        icon_name: :inputs,
        empty_message: "No attributes",
        class_name: "mb-4",
        options: { class: "bg-gray-100" }
      )
    )
    expect(page).to have_css(".mb-4.bg-gray-100")
  end

  it "renders body slot if given" do
    render_inline(
      described_class.new(
        title: "With Body",
        items:,
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        icon_name: :inputs,
        empty_message: "No attributes"
      )
    ) do |c|
      c.with_body do
        "Body slot content"
      end
    end
    expect(page).to have_text("Body slot content")
  end
end
