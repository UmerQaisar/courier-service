class HomeController < ApplicationController
    include JsonWebToken
    before_action :authenticate_user!

    def current_user_orders
        @orders = Order.get_current_user_orders(current_user.id).paginate(page: params[:page], per_page: 5)
    end

    def api_key
        @token = jwt_encode(current_user.id)
    end

end
