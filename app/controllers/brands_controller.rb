# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :find_brand, only: [:show, :approve]

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      puts "success result:  #{response}"
      render json: {status: 204, message: "Brand created"}
    else
      render json: {status: 400, message: "Brand #{request.parameters["name"]} already exists"}
    end
  end

  def index
    @brand = Brand.approved
    render json: {status: 200, brands: @brand}
  end

  def show
    render json: {status: 200, brand: @brand}
  end

  def approve
    if @brand.approved?
      render json: {status:400, message: "Brand #{@brand.name} already approved"}
    else
      @brand[:approved] = true
      @brand.save
      render json: {status: 200, message: "Brand #{@brand.name} approved"}
    end
  end

  def update; end

  private

  def find_brand
    @brand = Brand.find_by_name(params[:name])
    unless @brand
      render json: {status: 400, message: "brand not found"}
    end
  end

  def brand_params
    params.require(:name)
    params.permit(:name, :description, :country)
  end
end
