class TravelDetail < ApplicationRecord

  # associations
  belongs_to :user
  has_many :orders, dependent: :destroy

  # Scopes
  scope :get_current_user_travel_details, -> (current_user_id){where(:user_id => current_user_id)}

  #Method to Search a Specific Record
  def self.search(from_search, to_search)

    if from_search.present? && to_search.present?
      return TravelDetail.where("\"from\" like ?", "%#{from_search}%").where("\"to\" like ?", "%#{to_search}%")
    else if from_search.present?
          return TravelDetail.where("\"from\" like ?", "%#{from_search}%")
        else if to_search.present?
              return TravelDetail.where("\"to\" like ?", "%#{to_search}%")
            else
              TravelDetail.all
             end
        end
    end
  end


  #validations
  validates :to, :from, :capacity, :arrival_time, :departure_time, presence: true
  validate :dates_check, :capacity_check

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

  def capacity_check
    if capacity < '0'
      errors.add(:capacity, 'Capacity cannot be negative')
    end
  end

end
