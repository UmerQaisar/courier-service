class TravelDetailsController < ApplicationController

  before_action :find_travel_detail, only: [:edit, :update]

  # index action
  def index
    @travel_details = TravelDetail.search(params[:from_search],params[:to_search])
                                  .where.not(:user_id => current_user.id)
                                  .paginate(page: params[:page], per_page: 5)
  end


  def new
    @travel_detail = TravelDetail.new
  end

  def edit
    authorize @travel_detail
  end


  def create

    byebug

    @travel_detail = current_user.travel_details.new(travel_detail_params)

    # # Using Geocoder to find longitude and latitude
    # results_from = Geocoder.search(params[:travel_detail][:from])
    # if (geo = results_from.first)
    #   @travel_detail.from_latlng   = geo.coordinates
    # end
    #
    # results_to = Geocoder.search(params[:travel_detail][:to])
    # if (geo = results_to.first)
    #   @travel_detail.to_latlng   = geo.coordinates
    # end

    if @travel_detail.save
      flash[:notice] = 'Service Added To The List'
      redirect_to travel_details_path
    else
      render 'new'
    end
  end

  def update

    if @travel_detail.update(travel_detail_params)
      flash[:notice] = "Service Updated"
      render 'home/homepage'
    else
      render 'edit'
    end
  end

  def current_user_travel_details
    @travel_details = TravelDetail.get_current_user_travel_details(current_user.id).paginate(page: params[:page], per_page: 5)
  end

  private

  def find_travel_detail
    @travel_detail = TravelDetail.find(params[:id])
  end

  def travel_detail_params
    params.require(:travel_detail).permit(:to, :from, :departure_time,:arrival_time,:capacity, :additional_message, :going_by, :from_latlng, :to_latlng)
  end

end
