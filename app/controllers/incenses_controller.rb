# frozen_string_literal: true

class IncensesController < ApplicationController
  before_action :find_line, only: %i[create index show update]
  before_action :find_incense, only: %i[show update]

  def create
    @incense = Incense.new(incense_params)
    if @line.save
      render json: { status: 204, message: 'Incense created' }
    else
      render json: { status: 400, error: "Line #{request.parameters['name']} could not be created" }
    end
  end

  def index
    @incenses = Brand.find(@brand.id).lines.find(@line.id).incenses
    render json: { status: 200, incenses: @incenses }
  end

  def show
    render json: { status: 200, incense: @incense }
  end

  def update
    @incense.update(incense_params)
    render json: { status: 200, incense: @incense }
  end

  private

  def find_incense
    @incense = Incense.find_by(line_id: @line.id, name: params[:name])
    render json: { status: 400, message: 'Incense not found' } unless @incense
  end

  def find_line
    find_brand
    @line = Line.find_by(brand_id: @brand.id, name: params[:line_name])
    render json: { status: 400, message: 'line not found' } unless @line
    params[:line_id] = @line.id
  end

  def find_brand
    @brand = Brand.find_by_name(params[:brand_name])
    render json: { status: 400, message: 'Brand not found' } unless @brand
  end

  def incense_params
    params.require(:name)
    params.require(:line_id)
    params.permit(:name, :line_id, :description)
  end
end
