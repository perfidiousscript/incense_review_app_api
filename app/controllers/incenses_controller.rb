# frozen_string_literal: true

class IncensesController < ApplicationController
  before_action :find_incense, only: %i[show update]

  def create
    @incense = Incense.new(incense_params)
    if @line.save
      render json: { status: 204, message: 'Incense created' }
    else
      render json: {
        status: 400,
        error: "Line #{request.parameters['name']} could not be created"
      }
    end
  end

  def index
    @incenses = Line.find(params[:line_id]).incenses
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
    @incense = Incense.find_by(id: params[:id])
    render json: { status: 400, message: 'Incense not found' } unless @incense
  end

  def incense_params
    params.permit(:name, :line_id, :description)
  end

  def complile_statistics
    statistics_pre_hash = {
      sweet: [],
      sour: [],
      salty: [],
      bitter: [],
      umami: [],
      spice: [],
      earthy: [],
      woody: [],
      minutes: [],
      season: []
    }
    statistics_hash = {}
    @incense.reviews.each do |review|
      # Iterate over each key in statistics_pre_hash and push
      # the value from each review in.
    end
    # Then take averages of all the stats here and
    # push these averages into the statistics hash
  end
end
