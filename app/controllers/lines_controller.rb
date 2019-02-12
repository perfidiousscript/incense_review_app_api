# frozen_string_literal: true

class LinesController < ApplicationController
  before_action :find_line, only: [:show, :approve]
  before_action :find_brand, only: :create

  def create
    @line = Line.new(line_params)
    if @line.save
      puts "success result:  #{response}"
      render json: {status: 204, message: "Line created"}
    else
      render json: {status: 400, message: "Line #{request.parameters["name"]} could not be created"}
    end
  end

  def index
    @lines = Line.approved
    render json: {status: 200, brands: @lines}
  end

  def show
    render json: {status: 200, brands: @line}
  end

  def show
    render json: {status: 200, brand: @brand}
  end

  def approve
    if @line.approved?
      render json: {status:400, message: "Line #{@line.name} already approved"}
    else
      @line[:approved] = true
      @line.save
      render json: {status: 200, message: "Line #{@line.name} approved"}
    end
  end

  def update; end

  private

  def find_line
    find_brand(params[:brand_name])
    @line = Line.find_by_name(params[:line_name])
    unless @line
      render json: {status: 400, message: "line not found"}
    end
  end

  def find_brand(brand_name)
    @brand = Brand.find_by_name(brand_name)
    unless @brand
      render json: {status: 400, message: "brand not found"}
    end
    params[:brand_id] = @brand.id
  end

  def line_params
    params.require(:name)
    params.require(:brand_id)
    params.permit(:name, :description, :brand_id)
  end
end
