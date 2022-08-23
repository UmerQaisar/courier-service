require 'rails_helper'

RSpec.describe User, type: :model do

  user = build(:user)

  context 'should be valid' do
    it "with valid fields" do
      expect(user).to be_valid
    end

    it "with contact's digits = 7" do
      user.contact = '1234567'
      expect(user).to be_valid
    end
  end

  context 'should not be valid' do
    it 'without name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "without email " do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "without contact" do
      user.contact = nil
      expect(user).not_to be_valid
    end

    it "with contact containing alphabets" do
      user.contact = 'ABCDEFGHI'
      expect(user).not_to be_valid
    end

    it "with contact's digits < 7" do
      user.contact = '123456'
      expect(user).not_to be_valid
    end

  end

  it "should be an instance of User" do
    expect(user).to be_instance_of(User)
  end

  it "should have many travel_details" do
    u = User.reflect_on_association(:travel_details)
    expect(u.macro).to eq(:has_many)
  end


end
