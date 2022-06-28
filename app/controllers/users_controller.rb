class UsersController < ApplicationController
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
end
