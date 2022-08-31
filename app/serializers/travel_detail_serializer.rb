class TravelDetailSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :departure_time, :arrival_time, :capacity, :going_by
  has_many :orders
end
