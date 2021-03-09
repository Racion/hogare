class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?
  before_action :set_order
  def home
  end


  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dni, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :address])
  end

  def set_order
    if current_user.client 
      @order = current_user.client.order.where(order_status: 'Creada')
      if @order
        session[:order_id] = @order.id
      else
        @order = current_user.client.order.create
        session[:order_id] = @order.id
      end
    end
  end
end
