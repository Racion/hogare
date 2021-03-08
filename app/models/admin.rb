class Admin < ApplicationRecord
  belongs_to :user

  validates :address_description, presence: true, length: { maximum:140 }
  validates :address, presence: true, length: { maximum:100 }, uniqueness: true
  validates :address_complement, presence: true, length: { maximum:140 }
  validates :phone, presence: true

end
