# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :incense
  belongs_to :user
end
