class Employee < ApplicationRecord
  belongs_to :user

  #Relationships
  has_many :service
end
