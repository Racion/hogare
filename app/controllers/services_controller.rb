class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  # TODO: Faltan acciones y revisar que funcione
  def index
    @services = if current_user.admin
                  Service.all.page params[:page]
                else
                  current_user.client.services.page params[:page]
                end
  end

  def new
    @service = @order.services.new
  end

  def create
    @service = @order.services.create(service_params.merge(client_id: current_user.client.id))
    if @service.save
      flash[:success] = 'El servicio se agrego al carrito.'
      redirect_to orders_path
    else
      flash.now[:danger] = "Información Invalida: #{@service.errors.full_messages.join(', ')} "
      render 'new'
    end
  end

  private

  def service_params
    params.require(:service).permit(:service_description, :service_date, :address_id)
  end

  def set_order
    if current_user.client
      @order = current_user.client.orders.where(order_status: 'Creada').first
      @order || @order = current_user.client.orders.create
    end
  end

  def order_params
    params.require(:order).permit(:order_status, :order_total_value)
  end
end
