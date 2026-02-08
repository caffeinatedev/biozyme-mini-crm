class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :amount, numericality: { greater_than: 0 }
  validates :sold_on, presence: true
end