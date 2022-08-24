require 'rails_helper'

RSpec.describe "TravelDetails", type: :request do

  let(:user){create(:user)}

  before(:each) do
    sign_in user
  end

  describe "GET /travel_details" do
    it "Get Index" do
      get travel_details_path
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end

    it "Get Index format:html" do
      get travel_details_path, params: { format: :html }
      expect(response.headers["Content-Type"]).to include 'text/html'
      expect(response.status).to eq 200
    end

    it "Get Index format:js" do
      get travel_details_path, params: { format: 'js' }, xhr: true
      expect(response.headers["Content-Type"]).to include 'text/javascript'
      expect(response.status).to eq 200
    end

    it "Get My Travel Details" do
      get my_travel_details_travel_details_path
      expect(response).to render_template :my_travel_details
      expect(response).to have_http_status 200
    end

    it "Get New " do
      get new_travel_detail_path
      expect(response).to have_http_status 200
      expect(response.body).to include('Add Travel Details')
    end

    it "Get Edit" do
      travel_detail = create(:travel_detail, user: user)
      get edit_travel_detail_path(travel_detail)
      expect(response).to have_http_status 200
      expect(response.body).to include('Add Travel Details')
    end
  end

  describe 'Post /travel_details' do
    it "Create travel detail" do
      post '/travel_details', params: { travel_detail: attributes_for(:travel_detail)}
      expect(flash[:info_toast]).to eq('Service Added To The List')
      expect(response).to redirect_to(travel_details_path)
    end

    it "should not create travel detail with invalid attributes" do
      travel_detail_invalid = attributes_for(:travel_detail, from: nil, to: nil )

      post '/travel_details', params: { travel_detail: travel_detail_invalid}
      expect(response).to render_template :new
    end
  end

  describe 'Update travel_details' do

    let(:travel_detail) {create :travel_detail}

    it "Patch /travel_detail" do
      # send different attributes for travel_details
      patch "/travel_details/#{travel_detail.id}", params: {travel_detail: attributes_for(:travel_detail)}
      expect(flash[:info_toast]).to eq("Service Updated")
      expect(response).to redirect_to(travel_details_path)
    end

    it "Put /travel_detail" do
      # send different attributes for travel_details
      put  "/travel_details/#{travel_detail.id}", params: {travel_detail: attributes_for(:travel_detail)}
      expect(flash[:info_toast]).to eq("Service Updated")
      expect(response).to redirect_to(travel_details_path)
    end

    it "should not update travel_details with patch request" do
      travel_detail_invalid = attributes_for(:travel_detail, from: nil, to: nil )
      patch  "/travel_details/#{travel_detail.id}", params: {travel_detail: travel_detail_invalid}
      expect(response).to render_template :edit
    end

    it "should not update travel_details with put request" do
      travel_detail_invalid = attributes_for(:travel_detail, from: nil, to: nil )
      put  "/travel_details/#{travel_detail.id}", params: {travel_detail: travel_detail_invalid}
      expect(response).to render_template :edit
    end
  end



end
