class Order < ApplicationRecord
  belongs_to :client

  validates :order_status, presence: true
  validates :order_total_value, presence: true
  validates :client_id, presence: true
  
  #Relationships
  has_many :service
end
