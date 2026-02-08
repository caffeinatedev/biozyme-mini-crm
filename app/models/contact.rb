class Contact < ApplicationRecord
  belongs_to :primary_user, class_name: "User"

  has_many :sales, dependent: :destroy
  has_many :budgets, dependent: :destroy

  validates :name, presence: true
end