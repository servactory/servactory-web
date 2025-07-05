# frozen_string_literal: true

RSpec.describe Servactory::Web::VERSION do
  it { expect(Servactory::Web::VERSION::STRING).to be_present }
end
