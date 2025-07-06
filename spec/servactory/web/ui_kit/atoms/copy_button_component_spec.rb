# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::CopyButtonComponent, type: :component do
  it "renders the copy button with code in onclick", :aggregate_failures do
    render_inline(described_class.new(code: "def foo; end"))
    expect(page).to have_button("Copy")
    expect(page).to have_css("svg")
    expect(page).to have_css("button[onclick*='def foo; end']")
  end
end
