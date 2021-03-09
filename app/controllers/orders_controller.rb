class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = current_user.client.order.new
  end

  def show
    @order_list = current_user.client.orders.find(params[:id])
  end

  def index
    @orders = current_user.client.orders
  end

  def create
    @order = current_user.client.orders.create(order_params)
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
      params.require(:order).permit(:order_status, :order_total_value)
  end
end
