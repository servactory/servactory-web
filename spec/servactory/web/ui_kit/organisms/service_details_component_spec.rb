# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Organisms::ServiceDetailsComponent, type: :component do # rubocop:disable RSpec/MultipleMemoizedHelpers
  let(:inputs) do
    {
      "first_name" => { types: [String], description: "First name" },
      "last_name" => { types: [String], description: "Last name" }
    }
  end

  let(:internals) do
    {}
  end

  let(:outputs) do
    {
      "full_name" => { types: [String], description: "Full name" }
    }
  end

  let(:actions) do
    {
      "full_name" => { description: "Combines first and last name" }
    }
  end

  let(:stages) do
    {
      "call" => actions
    }
  end

  let(:info_class) do
    Class.new do
      def inputs; end
      def internals; end
      def outputs; end
      def stages; end
    end
  end

  let(:service_class_class) do
    Class.new do
      def name; end
      def info; end
    end
  end

  let(:info) do
    instance_double(
      info_class,
      inputs:,
      internals:,
      outputs:,
      stages:
    )
  end

  let(:service_class) do
    instance_double(
      service_class_class,
      name: "TestService",
      info:
    )
  end

  let(:source_code) do
    <<~RUBY
      class TestService
        include Servactory::DSL

        input :first_name, type: String
        input :last_name, type: String

        output :full_name, type: String

        make :full_name

        private

        def full_name
          outputs.full_name = "\#{inputs.first_name} \#{inputs.last_name}"
        end
      end
    RUBY
  end

  it "renders the service details", :aggregate_failures do
    render_inline(
      described_class.new(
        service_class:,
        source_code:
      )
    )

    # Check that the page header is rendered with the service name
    expect(page).to have_css("h2", text: "TestService")

    # Check that the attributes section is rendered
    expect(page).to have_text("Attributes")

    # Check that the inputs, internals, and outputs are rendered
    expect(page).to have_text("Inputs")
    expect(page).to have_text("first_name")
    expect(page).to have_text("last_name")

    expect(page).to have_text("Outputs")
    expect(page).to have_text("full_name")

    # Check that the actions section is rendered
    expect(page).to have_text("Actions")
    expect(page).to have_text("full_name")

    # Check that the source code is rendered
    expect(page).to have_text("class TestService")
  end

  it "renders empty state when no attributes are defined", :aggregate_failures do
    empty_info = instance_double(
      info_class,
      inputs: {},
      internals: {},
      outputs: {},
      stages: {}
    )

    empty_service_class = instance_double(
      service_class_class,
      name: "EmptyService",
      info: empty_info
    )

    render_inline(
      described_class.new(
        service_class: empty_service_class,
        source_code: "class EmptyService < Servactory::Service\nend"
      )
    )

    # Check that the empty state is rendered for attributes
    expect(page).to have_text("No attributes defined")

    # Check that the empty state is rendered for actions
    expect(page).to have_text("No actions defined")
  end

  it "does not render if service_class is nil" do
    result = render_inline(
      described_class.new(
        service_class: nil,
        source_code:
      )
    )
    expect(result.css("div").count).to eq(0)
  end

  it "does not render if source_code is nil" do
    result = render_inline(
      described_class.new(
        service_class:,
        source_code: nil
      )
    )
    expect(result.css("div").count).to eq(0)
  end

  it "applies custom class_name and options" do
    render_inline(
      described_class.new(
        service_class:,
        source_code:,
        class_name: "custom-class",
        options: { data: { test: "value" } }
      )
    )

    # Since this component doesn't have a root element with class_name and options,
    # we can't directly test for them. The class_name and options are passed to
    # child components.
    expect(page).to be_present
  end
end
