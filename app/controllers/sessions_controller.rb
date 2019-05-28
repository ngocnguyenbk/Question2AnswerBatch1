class SessionsController < ApplicationController
  REMEMBER_VALUE = 1
  def new
  end
  
  def create
    user = (User.login_scope user_params[:email_or_username]).take
    if user && user.authenticate(user_params[:password])
      log_in user
      params[:session][:remember_me] == REMEMBER_VALUE ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/password combination"
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def user_params
    params.require(:session).permit(:email_or_username, :password)
  end
end
