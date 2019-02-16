# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :line
  has_many :reviews
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :line_id
end
