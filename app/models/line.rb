# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :brand
  has_many :incenses
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :brand_id
  scope :approved, ->{ where approved: true }
  attr_accessor :approved

  def approved?
    self[:approved]
  end

end
