class Item < ApplicationRecord
  belongs_to :order

  validates :name, presence: true
end
