class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?
  def home
  end
  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dni, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :address])
  end
end
