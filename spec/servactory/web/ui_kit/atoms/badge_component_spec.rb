# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::BadgeComponent, type: :component do
  it "renders the badge text" do
    render_inline(described_class.new(text: "Hello Badge"))
    expect(page).to have_css("span", text: "Hello Badge")
  end

  it "applies custom class_name" do
    render_inline(described_class.new(text: "Styled", class_name: "bg-blue-100"))
    expect(page).to have_css("span.bg-blue-100", text: "Styled")
  end
end
