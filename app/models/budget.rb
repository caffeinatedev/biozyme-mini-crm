class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :year, presence: true
  validates :amount_cents, numericality: { greater_than: 0 }
end