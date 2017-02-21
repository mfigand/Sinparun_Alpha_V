class UsersController < ApplicationController

  before_action :authenticate_user!, except: :update


#CRUD methods
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
    @imgBackground = 1==2 ? "" : "https://freehtml5.co/demos/run/images/img_bg_1.jpg"
  end

  def edit

    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    if @user.update_attributes user_params
      redirect_to action: :show
    else
      render 'edit'
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  #Specific methods
  def sync_account_nike
   if current_user.kms.length == 0
     set_new_runner = User.new_runner_nike(current_user, params)
     render json: set_new_runner_nike, status: 201
   elsif current_user.kms[0].nike_last_total_kms == 0
     set_new_nike_account = User.new_nike_account(current_user, params)
     render json: set_new_nike_account, status: 201
   else
    update_runner_account = User.update_runner_nike(current_user, params)
     render json:update_runner_account, status: 201
   end
 end

 def sync_account_runtastic
   if current_user.kms.length == 0
     set_new_runner = User.new_runner_runtastic(current_user, params)
     render json: set_new_runner, status: 201
   elsif current_user.kms[0].runtastic_last_total_kms == 0
     set_new_runtastic_account = User.new_runtastic_account(current_user, params)
     render json: set_new_runtastic_account, status: 201
   else
    update_runner_account = User.update_runner_runtastic(current_user, params)
     render json:update_runner_account, status: 201
   end
 end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
  
end
