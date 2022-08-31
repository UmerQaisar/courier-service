module Api::V1
  class TravelDetailsController < ApplicationController
    skip_before_action :authenticate_user!, :verify_authenticity_token

    def index
      render json: TravelDetail.all
    end

    def show
      render json: TravelDetail.find_by(id: params[:id])
    end

    def create
      @travel_detail = TravelDetail.new(travel_detail_params)

      if @travel_detail.save
        render json: @travel_detail
      else
        render json: @travel_detail.errors
      end
    end

    private
    def travel_detail_params
      params.require(:travel_detail).permit(:to, :from, :departure_time, :arrival_time, :capacity, :additional_message, :going_by, :user_id)
    end

  end
end

# Dummy data for travel details
# travel_detail[from]:Karachi
# travel_detail[to]:Lahore
# travel_detail[departure_time]:2022-09-01T13:09:39.541Z
# travel_detail[arrival_time]:2022-09-03T13:09:39.541Z
# travel_detail[capacity]:100
# travel_detail[going_by]:Road
# travel_detail[user_id]:1

