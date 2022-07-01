# frozen_string_literal: true

class Staffs::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_resource, except: [:new, :create]
 
end
