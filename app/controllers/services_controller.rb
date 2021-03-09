class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  #TODO: Faltan acciones y revisar que funcione 
  def index 
    if current_user.admin
      @services = Service.all
    else
      @services = current_user.client.service
    end
  end

  def new 
    @service = current_user.client.order.service.new
  end

  def create 
    @service = current_user.client.order.where(order_status: 'Creada').service.create(service_params)
    if @service.save
      flash[:success] = 'El servicio se agrego al carrito.'
      redirect_to 'order/index'
    else
      flash.now[:danger] = 'Información Invalida.'
      render 'services/new'
    end
  end

  private

  def service_params
    params.require(:service).permit(:service_description, :service_date, :address)
  end

  def set_order
    if current_user.client 
      @order = current_user.client.orders.where(order_status: 'Creada').first
      if @order
        session[:order_id] = @order.id
      else
        @order = current_user.client.order.create
        session[:order_id] = @order.id
      end
    end
  end
end
