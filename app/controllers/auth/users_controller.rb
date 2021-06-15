class Auth::UsersController < ApplicationController
  layout "start", only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to home_path
    else
      render :new
    end
  end

  def add_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email,:role, :password, :password_confirmation)
  end
end
