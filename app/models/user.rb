class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum:50 }

  validates :last_name, presence: true, length: { maximum:50 }

  validates :dni, presence: true
  
  validates :phone, presence: true

  validates :address, presence: true, length: { maximum: 140 }

end
