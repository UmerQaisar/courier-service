# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  TravelDetail.create(
    from: FFaker::Address.city,
    to: FFaker::Address.city,
    departure_time: '2022-08-12 13:04:00',
    arrival_time: '2022-08-13 13:04:00',
    capacity: FFaker::rand(1..99),
    going_by: FFaker::Vehicle.model,
    user_id: rand(1..2)
  )
end