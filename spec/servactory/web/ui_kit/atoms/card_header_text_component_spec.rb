# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::CardHeaderTextComponent, type: :component do
  it "renders the header text" do
    render_inline(described_class.new(text: "Header"))
    expect(page).to have_css("h3", text: "Header")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(text: "Styled", class_name: "mb-2", options: { class: "text-blue-500" }))
    expect(page).to have_css("h3.mb-2.text-blue-500", text: "Styled")
  end
end
