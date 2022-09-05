class OrderSerializer < ActiveModel::Serializer
  attributes :id, :package_details, :weight
  has_many :items
end
