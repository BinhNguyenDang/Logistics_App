# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 5.times do |i|
#   Mode.create!(
#     name: "Mode #{i + 1}",
#     min_distance: 10 * (i + 1),
#     max_distance: 100 * (i + 1),
#     min_weight: 1 * (i + 1),
#     max_weight: 100 * (i + 1),
#     fixed_fee: 50,
#     active: true
#   )
# end

# for i in 1..3 do
#   Vehicle.create!(
#     plate: "ABC-123#{i}",
#     brand: "Brand #{i}",
#     model: "Model #{i}",
#     category: "Category #{i}",
#     year: "201#{i}",
#     capacity: 100 * i,
#     status: true,
#     mode_id: 1
#   )
# end

# for i in 1..3 do
#   Price.create!(
#     min_weight: 5 * i,
#     max_weight: 10 * i,
#     price_per_km: 0.11 * i,
#     mode_id: 1
#   )
#   Price.create!(
#     min_weight: 7 * i,
#     max_weight: 12 * i,
#     price_per_km: 0.16 * i,
#     mode_id: 2
#   )
# end

# for i in 1..3 do
#   Deadline.create!(
#     min_distance: 5 * i,
#     max_distance: 10 * i,
#     deadline: 15 * i,
#     mode_id: 1
#   )
#   Deadline.create!(
#     min_distance: 8 * i,
#     max_distance: 14 * i,
#     deadline: 18 * i,
#     mode_id: 2
#   )
# end
# 
for i in 1..2 do
  User.create!(
    name: "User #{i}",
    email: "user#{i}@email.com",
    password: '123456',
    role: "user"
  )
  User.create!(
    name: "Admin #{i}",
    email: "admin#{i}@email.com",
    password: '123456',
    role: "admin"
  )
end
