class SessionsController < ApplicationController
  remember_value = 1
  def new
  end
  
  def create
    user = (User.login_scope user_params[:email]).take
    if user && user.authenticate(user_params[:password])
      log_in user
      params[:session][:remember_me] == 'remember_value' ? remember(user) : forget(user)
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
      params.require(:session).permit(:email, :password)
    end
end
