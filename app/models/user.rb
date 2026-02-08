class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :owned_contacts,
           class_name: "Contact",
           foreign_key: :primary_user_id,
           dependent: :destroy

  has_many :sales, dependent: :destroy
  has_many :budgets, dependent: :destroy
end
