# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::EmptyStateComponent, type: :component do
  it "renders the empty state message", :aggregate_failures do
    render_inline(described_class.new(message: "No data"))
    expect(page).to have_text("No data")
    expect(page).to have_css("div.p-8.text-center.text-gray-500.text-sm")
  end

  it "applies custom class_name and options[:class]" do
    render_inline(described_class.new(message: "Styled", class_name: "mb-4", options: { class: "bg-gray-100" }))
    expect(page).to have_css("div.mb-4.bg-gray-100", text: "Styled")
  end
end
