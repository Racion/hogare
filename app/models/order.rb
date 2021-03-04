class Order < ApplicationRecord
  belongs_to :client_id

  #Relationships
  has_many :service
end
