require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(id:1, created_at: Time.now, updated_at:Time.now, name:'Umer', email:'umerqaisar@gmail.com', contact:'03345323234', password:'12412312')
  }

  context 'should be valid' do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "with contact's digits = 7" do
      subject.contact = '1234567'
      expect(subject).to be_valid
    end
  end

  context 'should not be valid' do
    it 'without name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "without email " do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "without contact" do
      subject.contact = nil
      expect(subject).not_to be_valid
    end

    it "with contact containing alphabets" do
      subject.contact = 'ABCDEFGHI'
      expect(subject).not_to be_valid
    end

    it "with contact's digits < 7" do
      subject.contact = '123456'
      expect(subject).not_to be_valid
    end

  end

  it "should be an instance of User" do
    expect(subject).to be_instance_of(User)
  end

  it "should have many travel_details" do
    u = User.reflect_on_association(:travel_details)
    expect(u.macro).to eq(:has_many)
  end


end
