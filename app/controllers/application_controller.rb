class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  def home
  end

  def show
  end

  def new_service
  end

  def cart
  end

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dni, :phone, :address])
  end
end
