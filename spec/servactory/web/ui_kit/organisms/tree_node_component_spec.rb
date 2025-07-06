# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::TreeNodeComponent, type: :component do
  let(:directory_node) { { name: "Dir", children: [{ name: "File", path: "file" }] } }
  let(:file_node) { { name: "File", path: "file" } }
  let(:url_helpers) { Servactory::Web::Engine.routes.url_helpers }

  it "renders directory node with children", :aggregate_failures do
    render_inline(described_class.new(node: directory_node))
    expect(page).to have_text("Dir")
    expect(page).to have_css("li[role='treeitem'][aria-expanded='true']")
    expect(page).to have_css("svg.size-4.text-amber-600")
    expect(page).to have_text("File")
  end

  it "renders file node with link", :aggregate_failures do
    render_inline(described_class.new(node: file_node))
    expect(page).to have_text("File")
    expect(page).to have_css("svg.size-3.text-gray-500")
    expect(page).to have_link("File", href: url_helpers.internal_service_path(file_node[:path]))
  end

  it "applies border class for nested level" do
    render_inline(described_class.new(node: file_node, level: 1))
    expect(page).to have_css(".border-l.border-dashed.border-gray-300.pl-4")
  end
end
