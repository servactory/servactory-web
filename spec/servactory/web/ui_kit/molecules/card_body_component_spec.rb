# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::CardBodyComponent, type: :component do
  it "renders the content" do
    render_inline(described_class.new) { "Body content" }
    expect(page).to have_text("Body content")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(class_name: "mb-4", options: { class: "bg-gray-100" })) { "Styled body" }
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Styled body")
  end
end
