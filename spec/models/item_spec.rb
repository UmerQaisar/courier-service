require 'rails_helper'

RSpec.describe Item, type: :model do

  item = build(:item)

  context 'Should not be valid' do
    it "when name is nil" do
      item.name = nil
      expect(item).not_to be_valid
    end

    it 'when order is not provided' do
      item.order = nil
      expect(item).not_to be_valid
    end
  end

  it "should be valid with valid attributes" do
    expect(item).to be_valid
  end

  it "Belongs to Order" do
    i = Item.reflect_on_association(:order)
    expect(i.macro).to eq(:belongs_to)
  end
end
