class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ApplicationHelper


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
     if resource.is_a?(User)
       current_user
     elsif resource.is_a?(Staff)
       current_staff
     else
       root_path
     end
   end
end
