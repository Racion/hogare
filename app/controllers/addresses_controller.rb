class AddressesController < ApplicationController
  before_action :authenticate_user!
  #TODO: Cambiar de current_user a client id ya que las relaciones van con el client id no con current_user
  # TODO: obtener el id de la tabla cliente segun el current_user para poder guardarlo con su referencia
  def index 
    @addresses = Address.where('client_id = ?', current_user.client.id) 
  end

  def new
    @address = Address.new
  end

  def create 
    @address = current_user.client.address.create(address_params)
    if @address.save
      flash[:success] = 'La dirección fue creada exitosamente.'
      redirect_to addresses_path
    else
      flash.now[:danger] = 'Información invalida'
      render 'new'
    end
  end

  def edit 
    @address = current_user.client.address.find(params[:id])
  end

  def update 
    @address = current_user.client.address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = 'Dirección actualizada.'
      redirect_to addresses_path 
    else
      flash.now[:danger] = 'Información Invalida.'
      render 'edit'
    end
  end


  protected
  def address_params
    params.require(:address).permit(:address_description, :address, :address_complement, :phone)
  end
end
