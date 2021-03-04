class Client < ApplicationRecord
  belongs_to :user_id

  # Relationships
  has_many :address
  has_many :order
  has_many :service
end
