module Api::V1
  class OrdersController < ApplicationController
    before_action :get_travel_detail
    skip_before_action :authenticate_user!, :verify_authenticity_token

    def index
      if @travel_detail.nil?
        render json: { error: 'travel detail does not exists' }
      else
        @orders = @travel_detail.orders
        render json: @orders
      end
    end

    def show
      if @travel_detail.nil?
        render json: { error: 'travel detail does not exists' }
      else
        @order = @travel_detail.orders.find_by(id: params[:id])
        render json: @order
      end
    end

    def create
      byebug
      @order = @travel_detail.orders.new(order_params)
      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors
      end
    end

    private

    def get_travel_detail
      @travel_detail = TravelDetail.find_by(id: params[:travel_detail_id])
    end

    def order_params
      params.require(:order).permit(:package_details, :weight, :user_id)
    end

  end
end