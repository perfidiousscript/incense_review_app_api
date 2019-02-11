# frozen_string_literal: true

class Brand < ApplicationRecord
  attr_accessor :approved
  has_many :lines
  validates :name, :country, presence: true
  validates_uniqueness_of :name
  scope :approved, -> { where approved: true }

  def approved?
    self[:approved]
  end

end
