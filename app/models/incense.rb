# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :line
  has_many :reviews
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :line_id

  INCENSE_ATTRIBUTES = [:sweet, :sour, :salty, :bitter, :umami, :spice, :earthy, :woody, :minutes, :season].freeze

  def compile_statistics
    statistics_hash = Hash[INCENSE_ATTRIBUTES.collect { |v| [v,{values_array: [], average: 0}] }]

    statistics_hash.each do |key,_v|
      unless key == :season
        statistics_hash[key][:average] = reviews.average(key)
      end
      reviews.each do |review|
        statistics_hash[key][:values_array].push(review["#{key}"])
      end
    end
  end
end
