module Api::V1
  class OrdersController < ApplicationController
    before_action :get_travel_details
    skip_before_action :authenticate_user!

    def index
      if @travel_details.nil?
        render json: {error: 'travel details does not exists'}
      else
        @orders = @travel_details.orders
        render json: @orders
      end
    end

    def show
      if @travel_details.nil?
        render json: {error: 'travel details does not exists'}
      else
        @order = @travel_details.orders.find_by(id: params[:id])
        render json: @order
      end
    end

    private

    def get_travel_details
      @travel_details = TravelDetail.find_by(id: params[:travel_detail_id])
    end

  end
end