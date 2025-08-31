# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Molecules::SectionHeaderComponent, type: :component do
  it "renders the section title and icon", :aggregate_failures do
    render_inline(described_class.new(title: "Inputs", icon_name: :stack))
    expect(page).to have_css("h3", text: "Inputs")
    expect(page).to have_css("svg.size-6.text-blue-600")
  end

  it "applies custom class_name and options[:class]", :aggregate_failures do
    render_inline(
      described_class.new(
        title: "Styled",
        icon_name: :code,
        class_name: "mb-4",
        options: { class: "bg-gray-100" }
      )
    )
    expect(page).to have_css(".mb-4.bg-gray-100", text: "Styled")
    expect(page).to have_css("svg.size-6.text-gray-600")
  end
end
