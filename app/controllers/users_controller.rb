class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.authenticate(change_password[:oldpassword])
      @user.update_attribute(:password, change_password[:newpassword])
      flash.now[:success] = "Password changed"
      render :show
    else
      flash.now[:warning] = "Old password uncorrect!"
      render :edit
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def user
    @user ||= User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def change_password
    params.require(:user).permit(:oldpassword, :newpassword)
  end
end
