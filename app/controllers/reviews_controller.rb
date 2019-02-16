class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      render json: { status: 204, message: 'Review created' }
    else
      render json: { status: 400, error: "Review could not be created" }
    end
  end

  def index
    @reviews = Incense.find(:params[incense_id]).reviews
    render json: { status: 200, reviews: @reviews }
  end

  def show
    @review = Review.find(params[:id])
    render json: { status: 200, review: @review }
  end

  private
  def review_params
    params.require(:incense_id)
    params.permit(:sweet, :sour, :salty, :bitter, :umami, :spice, :woody, :earthy, :minutes, :season, :review_text, :incense_id)
  end

end
