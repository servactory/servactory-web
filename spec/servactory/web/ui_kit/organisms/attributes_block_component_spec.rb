# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::AttributesBlockComponent, type: :component do
  let(:input_items) do
    {
      "user_id" => { types: [String], description: "User ID" },
      "email" => { types: [String], description: "Email address" }
    }
  end

  let(:internal_items) do
    {
      "normalized_email" => { types: [String], description: "Normalized email" }
    }
  end

  let(:output_items) do
    {
      "success" => { types: [TrueClass, FalseClass], description: "Operation result" }
    }
  end

  it "renders sections for all provided attributes", :aggregate_failures do
    render_inline(
      described_class.new(
        inputs: input_items,
        internals: internal_items,
        outputs: output_items
      )
    )

    # Check that all sections are rendered with correct titles
    expect(page).to have_text("Inputs")
    expect(page).to have_text("Internals")
    expect(page).to have_text("Outputs")

    # Check that items from each section are rendered
    expect(page).to have_text("user_id")
    expect(page).to have_text("email")
    expect(page).to have_text("normalized_email")
    expect(page).to have_text("success")

    # Check that the styling classes for each section are applied
    expect(page).to have_css(".border-blue-500")    # Inputs
    expect(page).to have_css(".border-purple-500")  # Internals
    expect(page).to have_css(".border-green-500")   # Outputs
  end

  it "renders only the sections with provided attributes", :aggregate_failures do
    render_inline(
      described_class.new(
        inputs: input_items,
        outputs: output_items
      )
    )

    # Check that only inputs and outputs sections are rendered
    expect(page).to have_text("Inputs")
    expect(page).to have_no_text("Internals")
    expect(page).to have_text("Outputs")

    # Check that only items from inputs and outputs are rendered
    expect(page).to have_text("user_id")
    expect(page).to have_text("email")
    expect(page).to have_no_text("normalized_email")
    expect(page).to have_text("success")
  end

  it "does not render if no attributes are provided" do
    result = render_inline(described_class.new)
    expect(result.css("div").count).to eq(0)
  end

  it "applies custom class_name" do
    render_inline(
      described_class.new(
        inputs: input_items,
        class_name: "custom-class"
      )
    )
    expect(page).to have_css("div.custom-class")
  end

  it "applies custom options", :aggregate_failures do
    render_inline(
      described_class.new(
        inputs: input_items,
        options: { class: "options-class", data: { test: "value" } }
      )
    )
    expect(page).to have_css("div.options-class")
    expect(page).to have_css("div[data-test='value']")
  end
end
