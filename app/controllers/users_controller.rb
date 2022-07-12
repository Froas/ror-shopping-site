class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :show]


  def logged_in_user 
    unless !current_user.nil? or !current_staff.nil?
      flash[:danger] = "Please Log in"
      redirect_to new_user_session_url
    end
  end
  def show
    @user = User.find(params[:id]) 
  end 

  def index 
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else 
      redirect_to root
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile has been updated"
      redirect_to current_user
    else 
      render "edit"
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
