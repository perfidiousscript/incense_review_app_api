# frozen_string_literal: true

class BrandsController < ApplicationController
  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      puts "success result:  #{response}"
      render json: {status: 200, message: "Brand created"}
    else
      render json: {status: 400, message: "Brand #{request.parameters["name"]} already exists"}
    end
  end

  def index
    Brand.where(approved: true)
  end

  def show
    Brand.find_by_name(params[:name])
  end

  def approve
    Brand.find_by_name(params[:name]).approve
  end

  def update; end

  private

  def brand_params
    params.permit(:name, :description, :country)
  end
end
