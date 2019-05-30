class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    @question = Question.all
    @search = params[:search]
    if @search.present?
      @title = @search[:title]
      @questions = Question.where(title: @title)      
    end
  end

  def logged_in_user
    return (redirect_to login_url; flash[:danger] = "Please log in.") if !logged_in?
  end

end
