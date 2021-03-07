class Service < ApplicationRecord
  belongs_to :order
  belongs_to :employee
  belongs_to :client
end
