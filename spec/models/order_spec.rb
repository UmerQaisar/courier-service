require 'rails_helper'

RSpec.describe Order, type: :model do
  order = build(:order)

  context 'Should be valid' do
    it "with valid fields" do
      expect(order).to be_valid
    end
  end

  context 'Should not be valid' do
    it "without user" do
      order.user = nil
      expect(order).not_to be_valid
    end

    it "when capacity < weight" do
      order.travel_detail.capacity = 5
      order.weight = 10
      expect(order).not_to be_valid
    end
  end

  it "Travel Details should have many orders" do
    t = TravelDetail.reflect_on_association(:orders)
    expect(t.macro).to eq(:has_many)
  end
end
