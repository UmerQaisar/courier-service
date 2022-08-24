require 'rails_helper'

RSpec.describe "Orders", type: :request do

  let(:travel_detail) { create :travel_detail }

  before(:each) do
    sign_in create :user
  end

  describe "GET /orders" do
    it "Get Index" do
      get travel_detail_orders_path(travel_detail)
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it "Get New Orders" do
      get new_travel_detail_order_path(travel_detail)
      expect(response).to have_http_status 200
      expect(response).to render_template :new
    end
  end

  describe 'Post /Orders' do
    it "Create Orders" do
      post "/travel_details/#{travel_detail.id}/orders", params: { order: attributes_for(:order) }
      expect(response).to redirect_to travel_details_path
      expect(flash[:info_toast]).to eq "Order Added  to The Service"
    end

    context 'should not create order' do
      let(:order) {build :order}

      it "with weight > capacity" do
        #travel detail capacity here is 100: < weight
        order.weight = 150
        post "/travel_details/#{travel_detail.id}/orders", params: { order: order.attributes }
        expect(response).to render_template :new
      end

      it "with invalid attributes" do
        order.weight = nil
        post "/travel_details/#{travel_detail.id}/orders", params: { order: order.attributes }
        expect(response).to render_template :new
      end
    end

  end

end
