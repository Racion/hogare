class Order < ApplicationRecord
  belongs_to :client
  #Relationships
  has_many :service
end
