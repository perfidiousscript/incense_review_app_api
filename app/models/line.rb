# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  scope :approved, ->(status) { where approved: status }
  attr_accessor :approved

  def approved?
    @approved
  end

  def approve
    @approved = true
    save
  end
end
