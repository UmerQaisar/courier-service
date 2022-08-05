class Order < ApplicationRecord

  # Associations
  belongs_to :travel_detail
  belongs_to :user

  # scopes
  scope :get_current_user_orders, ->(current_user_id) { where(:user_id => current_user_id)}

end
