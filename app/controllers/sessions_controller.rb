class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: user_params[:email]) || User.find_by(username: user_params[:email])
    if user && user.authenticate(user_params[:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
      else
        message = "Account not activated. "
        message += "Check your email for the activation link!"
        flash[:warning] = message
        redirect_to root_url
      end
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
      params.require(:session).permit(:username, :email, :password)
    end
end
