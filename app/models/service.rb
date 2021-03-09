class Service < ApplicationRecord
  belongs_to :order
  belongs_to :employee, optional: true
  belongs_to :client
  has_one :address
end
