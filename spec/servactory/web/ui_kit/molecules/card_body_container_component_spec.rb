# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::CardBodyContainerComponent, type: :component do
  it "renders the content" do
    render_inline(described_class.new) { "Container content" }
    expect(page).to have_text("Container content")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(class_name: "mb-4", options: { class: "bg-gray-100" })) { "Styled container" }
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Styled container")
  end
end
