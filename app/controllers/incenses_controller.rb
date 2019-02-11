# frozen_string_literal: true

class IncensesController < ApplicationController
  def new
    @incense = Incense.new(params)
    @incense.save
  end

  def show
    @brand = Brand.find(name: params[:brand_name])
    @line = Line.find(brand: @brand.id, line: params[:line_name]) if @brand
    @incense = Incense.find(line_id: @line.id, incense: params[:incense_name]) if @line
  end
end
