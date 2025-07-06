# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::CardHeaderComponent, type: :component do
  it "renders the header text" do
    render_inline(described_class.new(text: "Header"))
    expect(page).to have_css(".border-b.bg-gray-50", text: "Header")
  end

  it "renders content block if given" do
    render_inline(described_class.new) { "Custom content" }
    expect(page).to have_text("Custom content")
  end

  it "renders right slot if given" do
    render_inline(described_class.new) { |component| component.with_right { "Right content" } }
    expect(page).to have_text("Right content")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(text: "Styled", class_name: "mb-4", options: { class: "bg-gray-100" }))
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Styled")
  end
end
