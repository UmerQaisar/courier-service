FactoryBot.define do
  factory :travel_detail do
    from { FFaker::Address.city }
    to { FFaker::Address.city }
    departure_time { Time.now + 5.day }
    arrival_time { Time.now + 8.day }
    capacity { 100 }
    going_by { FFaker::Vehicle.model }
    user
  end
end