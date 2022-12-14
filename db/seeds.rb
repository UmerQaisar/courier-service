# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   TravelDetail.create(
#     from: FFaker::Address.city,
#     to: FFaker::Address.city,
#     departure_time: Time.now + 1.day,
#     arrival_time: Time.now + 2.day,
#     capacity: FFaker::rand(1..99),
#     going_by: FFaker::Vehicle.model,
#     user_id: 3
#   )
# end

100.times do
  Order.create(
    weight: rand(10..20),
    package_details: FFaker::LoremAR.word,
    travel_detail_id: rand(1..33),
    user_id:rand(1..3)
  )
end