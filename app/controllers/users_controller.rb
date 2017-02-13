class UsersController < ApplicationController
  before_action :authenticate_user!, except: :update

  def index
    @allUser = User.all
  end

  def new
    @user = User.new user_params
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "User created succesfully"
      render 'show'
    else
      flash[:alert] = "ALERT User not created"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
