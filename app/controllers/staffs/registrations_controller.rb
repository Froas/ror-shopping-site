

class Staffs::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_resource, except: [:new, :create]

  def show
    @staff = Staff.find(params[:id])
  end

  def new
    @staff = Staff.new
    
  end

  def create
    @staff = Staff.new(staff_params)
      if @staff.save
        flash[:success] = "Blog created"
        redirect_to root_url
      else
        render 'new'
      end
    end

    def staff_params
      params.require(:staff).permit(:name, :email, :password, :password_confirmation)
    end
end
