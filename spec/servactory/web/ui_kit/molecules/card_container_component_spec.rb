# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::CardContainerComponent, type: :component do
  it "renders the content" do
    render_inline(described_class.new) { "Card content" }
    expect(page).to have_text("Card content")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(class_name: "mb-4", options: { class: "bg-gray-100" })) { "Styled card" }
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Styled card")
  end
end
