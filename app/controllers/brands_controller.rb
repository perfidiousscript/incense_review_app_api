# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :find_brand, except: [:index, :index_unapproved]
  before_action :authenticate_user!, :index_unapproved

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      puts "success result:  #{response}"
      render json: { status: 204, message: 'Brand created' }
    else
      render json: {
        status: 400,
        message: "Brand #{request.parameters['name']} already exists"
      }
    end
  end

  def index
    @brands = Brand.approved
    render json: { status: 200, brands: @brands }
  end

  def index_unapproved
    @brands = Brand.where(approved: false)
    authorize! :index_unapproved, @brands
  end

  def incenses
    @incense_array = []
    @brand.lines.each do |line|
      line.incenses.each do |incense|
        @incense_array.push(incense)
      end
    end
    render json: { status: 200, incenses: @incense_array }
  end

  def show
    render json: { status: 200, brand: @brand }
  end

  def approve
    if @brand.approved?
      render json: {
        status: 400,
        message: "Brand #{@brand.name} already approved"
      }
    else
      @brand[:approved] = true
      @brand.save
      render json: { status: 200, message: "Brand #{@brand.name} approved" }
    end
  end

  def update; end

  private

  def find_brand
    @brand = Brand.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { status: 400, message: 'brand not found' }
  end

  def brand_params
    params.require(:name)
    params.permit(:name, :description, :country)
  end
end
