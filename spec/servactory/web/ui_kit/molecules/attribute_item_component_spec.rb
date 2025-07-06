# frozen_string_literal: true

class DummyAttribute
  def required? = true
end

RSpec.describe Servactory::Web::UiKit::Molecules::AttributeItemComponent, type: :component do
  it "renders the attribute name and classes", :aggregate_failures do
    render_inline(
      described_class.new(
        name: "user_id",
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50"
      )
    ) do
      "Description"
    end
    expect(page).to have_css("code.text-blue-700.bg-blue-50", text: "user_id")
    expect(page).to have_text("Description")
  end

  it "renders required badge if attribute responds to required?" do
    render_inline(
      described_class.new(
        name: "user_id",
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        attribute: DummyAttribute.new
      )
    ) do
      "Description"
    end
    expect(page).to have_text("required")
  end

  it "renders optional badge if attribute responds to required? and returns false" do
    dummy = instance_double(DummyAttribute, required?: false)
    render_inline(
      described_class.new(
        name: "user_id",
        border_class: "border-blue-500",
        text_class: "text-blue-700",
        bg_class: "bg-blue-50",
        attribute: dummy
      )
    ) do
      "Description"
    end
    expect(page).to have_text("optional")
  end
end
