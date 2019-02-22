# frozen_string_literal: true

class Incense < ApplicationRecord
  belongs_to :line
  has_many :reviews
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :line_id

  INCENSE_ATTRIBUTES = [:sweet, :sour, :salty, :bitter, :umami, :spice, :earthy, :woody, :minutes, :season].freeze

  def compile_statistics
    statistics_pre_hash = Hash[INCENSE_ATTRIBUTES.collect { |v| [v,[]] }]
    statistics_hash = {}
    reviews.each do |review|
      statistics_pre_hash.each do |key,value|
        statistics_pre_hash[key].push(review["#{key}"])
      end
    end
    puts "#{statistics_pre_hash}"
  end
end
