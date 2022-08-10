class TravelDetailPolicy < ApplicationPolicy
  attr_reader :user, :travel_detail

  def initialize(user, travel_detail)
    @user = user
    @travel_detail = travel_detail
  end

  def update?
    travel_detail.user_id == user.id
  end

end