module Api::V1
  class OrdersController < Api::BaseController
    before_action :get_travel_detail

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
      @order = @travel_detail.orders.new(order_params)
      @order.user_id = @current_user.id

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
      params.require(:order).permit(:package_details, :weight)
    end

  end
end