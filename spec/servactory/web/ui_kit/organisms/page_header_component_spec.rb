# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::PageHeaderComponent, type: :component do
  it "renders title only", :aggregate_failures do
    render_inline(described_class.new(title: "My Title"))
    expect(page).to have_css("h2.text-3xl.font-bold", text: "My Title")
    expect(page).to have_no_css("p.text-gray-600.text-base")
  end

  it "renders title and description", :aggregate_failures do
    render_inline(described_class.new(title: "My Title", description: "Description here"))
    expect(page).to have_css("h2.text-3xl.font-bold", text: "My Title")
    expect(page).to have_css("p.text-gray-600.text-base", text: "Description here")
  end
end
