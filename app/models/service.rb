class Service < ApplicationRecord
  belongs_to :order_id
  belongs_to :employee_id
  belongs_to :client_id
end
