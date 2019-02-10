# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :lines
  belongs_to :brand
end
