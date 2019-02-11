# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :brand_id
  scope :approved, ->(status) { where approved: status }
  attr_accessor :approved

  def approved?
    @approved
  end

  def approve
  end
end
