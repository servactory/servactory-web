# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::ColoredSectionHeaderComponent, type: :component do
  it "renders the title" do
    render_inline(
      described_class.new(
        title: "Test Title",
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700"
      )
    )
    expect(page).to have_css("div", text: "Test Title")
  end

  it "applies the provided classes" do
    render_inline(
      described_class.new(
        title: "Test Title",
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700"
      )
    )
    expect(page).to have_css("div.border-l-4.border-blue-500.bg-blue-100.text-blue-700")
  end

  it "applies custom class_name" do
    render_inline(
      described_class.new(
        title: "Test Title",
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700",
        class_name: "custom-class"
      )
    )
    expect(page).to have_css("div.custom-class")
  end

  it "applies custom options", :aggregate_failures do
    render_inline(
      described_class.new(
        title: "Test Title",
        border_class: "border-blue-500",
        bg_class: "bg-blue-100",
        text_class: "text-blue-700",
        options: { class: "options-class", data: { test: "value" } }
      )
    )
    expect(page).to have_css("div.options-class")
    expect(page).to have_css("div[data-test='value']")
  end
end
