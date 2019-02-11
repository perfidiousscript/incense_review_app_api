# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :lines
  validates :name, :country, presence: true
  validates_uniqueness_of :name
  scope :approved, ->(status) { where approved: status }

  def approved?
    approved
  end

  def approve
    approved = true
    save
  end
end
