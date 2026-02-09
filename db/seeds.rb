# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding users..."

asm1 = User.find_or_create_by!(email: "asm1@example.com") do |u|
  u.password = "password"
  u.name = "ASM 1"
end

asm2 = User.find_or_create_by!(email: "asm2@example.com") do |u|
  u.password = "password"
  u.name = "ASM 2"
end

puts "Seeding contacts..."

contact_a = Contact.create!(
  name: "Acme Corp",
  company: "Acme",
  email: "acme@example.com",
  primary_user: asm1
)

contact_b = Contact.create!(
  name: "Globex Ltd",
  company: "Globex",
  email: "globex@example.com",
  primary_user: asm1
)

contact_c = Contact.create!(
  name: "Initech",
  company: "Initech",
  email: "initech@example.com",
  primary_user: asm2
)

puts "Seeding budgets..."

[2023, 2024, 2025, 2026].each do |year|
  Budget.create!(
    user: asm1,
    contact: contact_a,
    year: year,
    amount: 200000
  )

  Budget.create!(
    user: asm1,
    contact: contact_b,
    year: year,
    amount: 150000
  )
end

puts "Seeding sales..."

Sale.create!(
  user: asm1,
  contact: contact_a,
  amount: 45000,
  sold_on: Date.new(2023, 1, 18)
)

Sale.create!(
  user: asm,
  contact: contact,
  amount: 50000,
  sold_on: Date.new(2024, 2, 15)
)

Sale.create!(
  user: second_user,
  contact: contact,
  amount: 30000,
  sold_on: Date.new(2024, 5, 20)
)

Budget.create!(
  user: asm,
  contact: contact,
  year: 2024,
  amount: 200000
)
