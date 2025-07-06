# frozen_string_literal: true

RSpec.describe Servactory::Web::UiKit::Atoms::IconComponent, type: :component do
  Servactory::Web::UiKit::Atoms::IconComponent::ICONS.each_key do |icon_name|
    it "renders SVG for icon: #{icon_name}" do
      render_inline(described_class.new(name: icon_name, class_name: "size-6 text-gray-600"))
      expect(page).to have_css("svg.size-6.text-gray-600")
    end
  end
end
