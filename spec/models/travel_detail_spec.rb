require 'rails_helper'

RSpec.describe TravelDetail, type: :model do

  travel_details = create(:travel_detail)

  context 'Should be valid' do
    it "with valid fields provided" do
      expect(travel_details).to be_valid
    end
  end

  context 'Should not be valid' do
    it "with departure time in past" do
      travel_details.departure_time = Time.now - 1.day
      expect(travel_details).not_to be_valid
    end

    it "with arrival time is earlier than departure time" do
      travel_details.arrival_time = Time.now
      travel_details.departure_time = Time.now + 1.day
      expect(travel_details).not_to be_valid
    end

    it "when user doesn't exists" do
      travel_details.user = nil
      expect(travel_details).not_to be_valid
    end

    it "when capacity is in negative" do
      travel_details.capacity = -12
      expect(travel_details).not_to be_valid
    end
  end

  it "should belongs to a user" do
    t = TravelDetail.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end


end
