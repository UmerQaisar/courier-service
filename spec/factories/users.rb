FactoryBot.define do
  factory :user do
    email {FFaker::Internet.email}
    password {'12345678'}
    name {FFaker::Name.name}
    contact {'123344567'}
  end
end