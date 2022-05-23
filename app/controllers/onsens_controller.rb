class OnsensController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @onsens = Onsen.page(params[:page])
  end  
 
  def rank 
    @onsens = Onsen.
              left_joins(:reviews).
              distinct.
              sort_by do |onsen|
                hoges = onsen.reviews
                if hoges.present?
                  hoges.map(&:score).sum / hoges.size
                else 
                  0
                end
              end.
              reverse
  end 
  def show
    @onsen = Onsen.find(params[:id])
    @review = Review.new 
  end
  
end
