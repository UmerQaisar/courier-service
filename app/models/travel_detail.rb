class TravelDetail < ApplicationRecord

  # associations
  belongs_to :user
  has_many :orders, dependent: :destroy

  # Scopes
  scope :get_current_user_travel_details, -> (current_user_id){where(:user_id => current_user_id)}

  #validations
  validates :to, :from, :capacity, :arrival_time, :departure_time, presence: true
  validate :dates_check

  def dates_check
    if arrival_time.present? && arrival_time < Time.now
      errors.add(:arrival_time, 'Arrival Date and Time Cannot be in the Past')
    end

    if departure_time.present? && departure_time < Time.now
      errors.add(:departure_time, 'Departure Date and Time Cannot be in the Past')
    end

    if departure_time.present? && arrival_time.present? && arrival_time <= departure_time
      errors.add(:arrival_time, 'Arrival Time cannot be earlier than Departure Time')
    end


  end

end
