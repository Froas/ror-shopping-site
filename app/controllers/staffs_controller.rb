class StaffsController < ApplicationController
before_action :staff_users

  def staff_users
    redirect_to(root_path) if current_staff.nil?
  end
  def index 
    @staffs = Staff.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_url 
  end 

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      flash[:success] = "Staff created"
      redirect_to staffs_path
    else 
      render 'new'
    end
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      flash[:success] = "Profile has been updated"
      redirect_to current_staff
    else 
      render "edit"
    end
  end

  def staff_params
    params.require(:staff).permit(:name, :email, :password, :password_confirmation)
  end
end
