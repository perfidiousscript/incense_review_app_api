# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  scope :approved, ->(status) { where approval: status }

  def approved?
    approval
  end

  def approve
    approved = true
    save
  end
end
