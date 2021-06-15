class Auth::SessionsController < ApplicationController
  layout "start"
  before_action :load_user, only: [:create]
  
  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to home_path
    else
      flash[:danger] = t :login_error_txt
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def load_user
    @user = User.find_by(email: params[:session][:email].downcase)
  end

end
