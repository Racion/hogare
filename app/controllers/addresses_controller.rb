class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def index 
    @addresses = current_user.address
  end

  def create 
    @address = current_user.address.create(address_params)
    if @address.save
      flash[:success] = 'La dirección fue creada exitosamente.'
      redirect_to 'index'
    else
      flash.now[:danger] = 'Información invalida'
      render 'new'
    end
  end


  protected
  def address_params
    params.require(:address).permit(:address_description, :address, :address_complement, :phone, :client_id)
  end
end
