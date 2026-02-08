# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(email: "asm1@example.com") do |u|
  u.password = "password"
  u.name = "ASM 1"
end

asm = User.find_by(email: "asm1@example.com")

second_user = User.create!(
  email: "asm2@example.com",
  password: "password",
  name: "ASM 2"
)

contact = Contact.create!(
  name: "Acme Corp",
  company: "Acme",
  email: "contact@acme.test",
  primary_user: asm
)

Sale.create!(
  user: asm,
  contact: contact,
  amount_cents: 50_000,
  sold_on: Date.new(2024, 2, 15)
)

Sale.create!(
  user: second_user,
  contact: contact,
  amount_cents: 30_000,
  sold_on: Date.new(2024, 5, 20)
)

Budget.create!(
  user: asm,
  contact: contact,
  year: 2024,
  amount_cents: 200_000
)