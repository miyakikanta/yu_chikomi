class OnsensController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @onsens = Onsen.page(params[:page])
  end

  def show
    @onsen = Onsen.find(params[:id])
    @review = Review.new 
  end
end
