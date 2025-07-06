# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::CardComponent, type: :component do
  it "renders content inside card body", :aggregate_failures do
    render_inline(described_class.new) { "Card body content" }
    expect(page).to have_text("Card body content")
    expect(page).to have_css(".border.rounded-lg.bg-white.shadow-sm")
  end

  it "renders header slot if given", :aggregate_failures do
    render_inline(described_class.new) do |card|
      card.with_header { "Header content" }
      "Body content"
    end
    expect(page).to have_text("Header content")
    expect(page).to have_text("Body content")
  end

  it "applies custom class_name and options" do
    render_inline(described_class.new(class_name: "mb-4", options: { class: "bg-gray-100" })) { "Custom card" }
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Custom card")
  end
end
