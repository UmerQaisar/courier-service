class Order < ApplicationRecord

  # Associations
  belongs_to :travel_detail
  belongs_to :user
  has_many :items, dependent: :destroy

  # scopes
  scope :get_current_user_orders, ->(current_user_id) { where(:user_id => current_user_id)}

  #validations
  validates :package_details, :weight, presence: true
  validate :check_capacity


  # Custom Validation
  def check_capacity

    if weight.to_f > travel_detail.capacity.to_f
      errors.add(:weight, "is greater than the capacity of service")
    end
  end

end
