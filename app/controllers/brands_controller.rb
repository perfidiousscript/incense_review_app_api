# frozen_string_literal: true

class BrandsController < ApplicationController
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
    @brand = Brand.where(approved: true)
    render json: {brands: @brand}
  end

  def show
    Brand.find_by_name(params[:name])
  end

  def approve
    @brand = Brand.find_by_name(params[:name])
    if @brand.approved?
      render json: {status:400, message: "Brand #{@brand.name} already approved"}
    else
      @brand.approve
      render json: {status: 200, message: "Brand #{@brand.name} approved"}
    end
  end

  def update; end

  private

  def brand_params
    params.permit(:name, :description, :country)
  end
end
