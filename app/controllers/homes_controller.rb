class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:mypage] 
  def top
  end
  
  
  def mypage
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end 

end