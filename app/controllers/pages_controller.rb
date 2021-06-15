class PagesController < ApplicationController
  layout "start", only: [:start]

  def home
    redirect_to root_url unless logged_in?
    if logged_in?
      return @courses=current_user.courses if current_user.role
      @user_courses = current_user.user_courses
    end
  end
  
  def start
    redirect_to :home if logged_in?
  end
end
