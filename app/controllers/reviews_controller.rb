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

  end

  def show; end

  private
  def review_params
    param.require(:incense_id)
    params.permit(:sweet, :sour, :salty, :bitter, :umami, :spice, :woody, :earthy, :minutes, :season, :review_text, :incense_id)
  end

end
