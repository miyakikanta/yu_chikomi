class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:create,:destroy,:index] 
  def index
    @onsen = Onsen.find(params[:onsen_id])
    @reviews = @onsen.reviews.page(params[:page])
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
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to onsens_path 
  end
 
  def edit    
    @review = Review.find(params[:id])
  end
    
  def update
    @review = Review.find(params[:id])
    @review.user_id = current_user.id 
   if  @review.update(review_params)
     redirect_to onsen_reviews_path(@review.onsen)
     flash[:notice] = "You have updated review successfully" 
   else
     @onsen = Onsen.find(params[:onsen_id])
     render "onsens/show"
   end
  end


  private
  def review_params
    params.require(:review).permit(:onsen_id,:user_id, :score, :impression)
  end
end 
 