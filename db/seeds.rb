# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
5.times do |i|
  Mode.create!(
    name: "Mode #{i + 1}",
    min_distance: 10 * (i + 1),
    max_distance: 100 * (i + 1),
    min_weight: 1 * (i + 1),
    max_weight: 100 * (i + 1),
    fixed_fee: 50,
    active: true
  )
end