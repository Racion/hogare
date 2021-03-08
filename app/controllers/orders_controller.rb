class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = Order.new
  end

  def show
    @order_list = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = 'orden creada con exito!'
      redirect_to 'index'
    else
      flash.now[:danger] = 'Informacion invalida'
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  private #------------------------------------------------------------------------------------------

  def order_params
      params.require(:order).permit(:order_status, :order_total_value, :client_id)
  end
end
