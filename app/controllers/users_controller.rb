class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]

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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.authenticate(change_password[:oldpassword])
      @user.update_attribute(:password, change_password[:newpassword])
      flash.now[:notice] = "Password changed"
      render :show
    else
      flash.now[:warning] = "Old password uncorrect!"
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def change_password
      params.require(:user).permit(:oldpassword, :newpassword)
    end
end
