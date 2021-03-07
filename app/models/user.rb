class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # Relationships between roles
  has_one :admin
  has_one :client
  has_one :employee

  after_create :create_client

  validates :first_name, presence: true, length: { maximum:50 }
  validates :last_name, presence: true, length: { maximum:50 }
  validates :dni, presence: true
  validates :phone, presence: true
  validates :address, presence: true, length: { maximum: 140 }

  def create_client  
    if employee.blank? && admin.blank?
      client ||= Client.create(user_id: id)
    end
  end

end
