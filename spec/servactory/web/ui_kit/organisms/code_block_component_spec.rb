# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::CodeBlockComponent, type: :component do
  it "renders code block with default language and copy button", :aggregate_failures do
    render_inline(described_class.new(code: "def foo; end"))
    expect(page).to have_css("pre.bg-gray-900")
    expect(page).to have_css("code.language-ruby", text: "def foo; end")
    expect(page).to have_text("Source Code")
    expect(page).to have_button("Copy")
    expect(page).to have_css("svg.size-6.text-gray-600")
  end

  it "renders code block with custom language" do
    render_inline(described_class.new(code: "console.log('hi')", language: "js"))
    expect(page).to have_css("code.language-js", text: "console.log('hi')")
  end

  it "does not render copy button if copy_button is false" do
    render_inline(described_class.new(code: "puts 1", copy_button: false))
    expect(page).to have_no_button("Copy")
  end
end
