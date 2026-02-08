class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :year, presence: true
  validates :amount, numericality: { greater_than: 0 }
end