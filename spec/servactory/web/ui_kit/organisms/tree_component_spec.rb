# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::TreeComponent, type: :component do
  let(:nodes) do
    [
      { name: "Dir1", children: [{ name: "File1", path: "file1" }] },
      { name: "File2", path: "file2" }
    ]
  end

  it "renders tree with directories and files", :aggregate_failures do
    render_inline(described_class.new(nodes:, route_type: :internal))
    expect(page).to have_css("nav[aria-label='Services navigation']")
    expect(page).to have_text("Dir1")
    expect(page).to have_text("File1")
    expect(page).to have_text("File2")
    expect(page).to have_css("ul[role='tree']")
    expect(page).to have_css("li[role='treeitem']")
  end

  it "applies custom class_name and options" do
    render_inline(described_class.new(nodes:, class_name: "mb-4", options: { class: "bg-gray-100" },
                                      route_type: :internal))
    expect(page).to have_css(".mb-4.bg-gray-100")
  end
end
