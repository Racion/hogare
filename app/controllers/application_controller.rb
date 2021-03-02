class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dni, :phone, :address])
  end
end
