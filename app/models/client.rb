class Client < ApplicationRecord
  belongs_to :user
  #Relationships
  has_many :addresses
  has_many :orders
  has_many :services
end
