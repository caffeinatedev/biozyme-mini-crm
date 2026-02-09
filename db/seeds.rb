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
  primary_user: asm2
)

contact_c = Contact.create!(
  name: "Initech",
  company: "Initech",
  email: "initech@example.com",
  primary_user: asm1
)
contact_d = Contact.create!(
  name: "Alpha llc",
  email: "alpha@llc.com",
  primary_user: asm2
)
puts "Seeding budgets..."

[2025, 2026].each do |year|
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
    amount: 200000
  )

  Budget.create!(
    user: asm2,
    contact: contact_c,
    year: year,
    amount: 200000
  )

  Budget.create!(
    user: asm2,
    contact: contact_d,
    year: year,
    amount: 150000
  )
end

puts "Seeding sales..."

# ---- 2025 ----
# DIRECT for ASM 1
Sale.create!(user: asm1, contact: contact_a, amount: 35000, sold_on: Date.new(2025, 1, 25))

# DIRECT for ASM 1 && INDIRECT for ASM 2
Sale.create!(user: asm1, contact: contact_b, amount: 20000, sold_on: Date.new(2025, 3, 14))

# DIRECT for ASM 2 and DIRECT for ASM 1
Sale.create!(user: asm2, contact: contact_c, amount: 70000, sold_on: Date.new(2025, 10, 30))

# DIRECT for ASM 2
Sale.create!(user: asm2, contact: contact_d, amount: 25000, sold_on: Date.new(2025, 9, 9))

# ---- 2026 ----
# DIRECT for ASM 1
Sale.create!(user: asm1, contact: contact_a, amount: 20000, sold_on: Date.new(2026, 1, 25))

# DIRECT for ASM 1 && INDIRECT for ASM 2
Sale.create!(user: asm1, contact: contact_b, amount: 40000, sold_on: Date.new(2026, 3, 14))

# DIRECT for ASM 2 and DIRECT for ASM 1
Sale.create!(user: asm2, contact: contact_c, amount: 30000, sold_on: Date.new(2026, 10, 30))

# DIRECT for ASM 2
Sale.create!(user: asm2, contact: contact_d, amount: 60000, sold_on: Date.new(2026, 9, 9))