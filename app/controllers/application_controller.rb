class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return (redirect_to login_url; flash[:danger] = "Please log in.") if !logged_in?
  end

end
