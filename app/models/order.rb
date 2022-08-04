class Order < ApplicationRecord

  belongs_to :travel_detail
  belongs_to :user
end
