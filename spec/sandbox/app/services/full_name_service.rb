# frozen_string_literal: true

class FullNameService
  include Servactory::DSL

  input :first_name, type: String
  input :last_name, type: String

  output :full_name, type: String

  make :full_name

  private

  def full_name
    outputs.full_name = "#{inputs.first_name} #{inputs.last_name}"
  end
end
