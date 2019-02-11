# frozen_string_literal: true

class LinesController < ApplicationController
  def create
    @line = Line.new(params)
    @line.save
  end

  def index
    @lines = Lines.where(approval: true)
  end

  def show
    @brand = Brand.find(name: params[:brand_name])
    @line = Line.find(brand: @brand.id, name: params[:line_name])
  end

  def approve; end

  def update; end
end
