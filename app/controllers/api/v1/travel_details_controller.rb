module Api::V1
  class TravelDetailsController < ApplicationController
    skip_before_action :authenticate_user!

    def index
      render json: TravelDetail.all
    end

    def show
      render json: TravelDetail.find_by(id: params[:id])
    end

    # # Request to Create
    # # http://localhost:3000/api/v1/travel_details?to=lahore&from =karachi&departure_time=09/20/2022, 08:28 PM&arrival_time=09/25/2022, 08:28 PM&capacity=234&going_by=Road&user_id=3
    # def create
    #   byebug
    #   @travel_detail = travel_details.new(travel_detail_params)
    #
    #   if @travel_detail.save
    #     render json: @travel_detail
    #   else
    #     render json: @travel_detail.errors
    #   end
    # end

    private
    def travel_detail_params
      params.require(:travel_detail).permit(:to, :from, :departure_time, :arrival_time, :capacity, :additional_message, :going_by, user_id)
    end

  end
end

