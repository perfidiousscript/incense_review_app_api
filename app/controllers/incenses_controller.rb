# frozen_string_literal: true

class IncensesController < ApplicationController
  before_action :find_line, only: [:create, :index, :show]
  before_action :find_brand, only: [:create, :index, :show]
  before_action :find_incense, only: :show

  def create
    @incense = Incense.new(incense_params)
    if @line.save
      puts "success result:  #{response}"
      render json: {status: 204, message: "Line created"}
    else
      render json: {status: 400, error: "Line #{request.parameters["name"]} could not be created"}
    end
  end

  def index
    @incenses = Brand.find(@brand.id).lines.find(@line.id).incenses
    render json: {status: 200, brands: @incenses}
  end

  def show
    render json: {status: 200, brands: @incense}
  end

  def update; end

  private

  def find_incense
    @incense = Incense.find_by(line_id: @line.id, name: params[:name])
    unless @incense
      render json: {status: 400, message: "Incense not found"}
    end
  end

  def find_line
    @line = Line.find_by_name(params[:line_name])
    unless @line
      render json: {status: 400, message: "line not found"}
    end
    params[:line_id] = @line.id
  end

  def find_brand
    @brand = Brand.find_by_name(params[:brand_name])
    unless @brand
      render json: {status: 400, message: "Brand not found"}
    end
    params[:brand_id] = @brand.id
  end

  def incense_params
    params.require(:name)
    params.require(:line_id)
    params.permit(:name, :brand_id, :line_id)
  end
end
