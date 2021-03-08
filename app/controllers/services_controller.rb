class ServicesController < ApplicationController
  before_action :authenticate_user!

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
    params.require(:service).permit(:service_description, :service_date, :price)
  end
end
