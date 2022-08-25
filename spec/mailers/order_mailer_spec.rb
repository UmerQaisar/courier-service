require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do

  describe 'Send Email on Order Confirmation' do

    let(:user){ create :user}
    let(:travel_detail){create :travel_detail}
    let(:order){create :order, user: user, travel_detail: travel_detail}
    let(:mail){ OrderMailer.with(user: user, travel_detail: travel_detail, order: order).order_placed_email }

    it "Render Header" do
      expect(mail.subject).to eq 'Order placed on your service'
      expect(mail.to).to eq ["#{travel_detail.user.email}"]
      expect(mail.from).to eq ["courier@gmail.com"]
    end

    it "Render body" do
      expect(mail.body).to include("has placed order on your service")
    end

  end
end
