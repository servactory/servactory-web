# frozen_string_literal: true

# class ApplicationRecord < ActiveRecord::Base
#   primary_abstract_class
# end

class ApplicationRecord
  include ActiveModel::Model
  include ActiveModel::Attributes
end
