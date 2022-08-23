FactoryBot.define do
  factory :order do
    package_details {FFaker::LoremAR.word}
    weight {25}
    travel_detail
    user
  end
end
