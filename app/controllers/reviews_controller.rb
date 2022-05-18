class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:create]
  def index
    @onsen = Onsen.find(params[:onsen_id])
    @reviews = @onsen.reviews
  end

  def create 
    @review = Review.new(review_params)
    @review.user_id = current_user.id 
    if @review.save 
      redirect_to onsen_reviews_path(@review.onsen)
    else
      @onsen = Onsen.find(params[:onsen_id])
      render "onsens/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:onsen_id, :score, :impression)
  end
end 
