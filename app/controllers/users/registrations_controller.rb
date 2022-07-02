# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_resource, except: [:destory]
 def create
  @user = User.new(user_params)
    if @user.save
      flash[:success] = "Blog created"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
