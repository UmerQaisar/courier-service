FactoryBot.define do
  factory :item do
    name {FFaker::Name.name}
    order
  end
end
