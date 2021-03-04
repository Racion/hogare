class Employee < ApplicationRecord
  belongs_to :user_id

  #Relationships
  has_many :service
end
