class UsersController < ApplicationController
  def show
    @user = User.fing(params[:id]) 
  end 
end
