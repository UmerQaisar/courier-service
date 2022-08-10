class OrdersController < ApplicationController

  before_action :get_travel_detail, only: [:new, :create, :index]

  def index
    @orders = @travel_detail.orders.all
  end


  def new
    @order = @travel_detail.orders.new
    authorize @order
  end

  def create

    @travel_detail = TravelDetail.find(params[:travel_detail_id])
    @order = @travel_detail.orders.new(order_params)
    @order.user_id = current_user.id

    if @order.save
      flash[:notice] = "Order Added  to The Service"
      redirect_to travel_details_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:package_details, :weight)
  end

  def get_travel_detail
    @travel_detail = TravelDetail.find(params[:travel_detail_id])
  end

end
