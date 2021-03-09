class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = current_user.client.order.new
  end

  def show
  end

  def index
    @orders = current_user.client.orders.all
  end
end
