# frozen_string_literal: true

class LinesController < ApplicationController
  before_action :find_line, except: [:index, :index_unapproved]

  def create
    @line = Line.new(line_params)
    if @line.save
      puts "success result:  #{response}"
      render json: { status: 204, message: 'Line created' }
    else
      render json: {
        status: 400,
        error: "Line #{request.parameters['name']} could not be created"
      }
    end
  end

  def index
    @lines = Line.find_by(brand_id: params[:brand_id])
    render json: { status: 200, lines: @lines }
  end

  def index_unapproved
    @lines = Line.where(approved: false)
    render json: { status: 200, lines: @lines }
  end

  def show
    render json: { status: 200, lines: @line }
  end

  def approve
    if @line.approved?
      render json: {
        status: 400,
        error: "Line #{@line.name} already approved"
      }
    else
      @line[:approved] = true
      @line.save
      render json: { status: 200, message: "Line #{@line.name} approved" }
    end
  end

  def update; end

  private

  def find_line
    @line = Line.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { status: 400, message: 'line not found' }
  end

  def line_params
    params.require(:name)
    params.require(:brand_id)
    params.permit(:name, :description, :brand_id)
  end
end
