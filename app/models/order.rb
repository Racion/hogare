class Order < ApplicationRecord
  belongs_to :client

  validates :order_status, presence: true
  validates :order_total_value, presence: true
  validates :client_id, presence: true

  def checkout(order_id)
      @order = current_user.client.orders.where(order_id: order_id)
      @order.update(order_status:  "Procesando")
  end
  
  #Relationships
  has_many :services
  
end
 