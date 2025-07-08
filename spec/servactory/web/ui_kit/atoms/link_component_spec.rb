# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::LinkComponent, type: :component do
  it "renders the link with text and href" do
    render_inline(described_class.new(href: "/docs", text: "Docs"))
    expect(page).to have_link("Docs", href: "/docs")
  end

  it "applies options including class and target", :aggregate_failures do
    render_inline(
      described_class.new(
        href: "/docs",
        text: "Docs",
        options: {
          class: "text-blue-600",
          target: "_blank"
        }
      )
    )
    expect(page).to have_link("Docs", href: "/docs")
    expect(page).to have_css("a.text-blue-600[target='_blank']")
  end
end
