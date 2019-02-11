# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :lines
  belongs_to :brand
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :line_id
end
