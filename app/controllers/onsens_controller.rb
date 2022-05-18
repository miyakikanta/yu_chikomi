class OnsensController < ApplicationController
  def index
    @onsens = Onsen.all
  end

  def show
    @onsen = Onsen.find(params[:id])
    @review = Review.new 
  end
end
