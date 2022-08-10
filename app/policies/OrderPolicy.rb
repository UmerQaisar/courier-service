class OrderPolicy < ApplicationPolicy
attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @order = order
  end

  def new?
    order.travel_detail.user_id != user.id
  end

end