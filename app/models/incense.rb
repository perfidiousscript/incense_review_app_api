# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :lines
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :line_id
end
