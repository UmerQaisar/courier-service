class HomeController < ApplicationController

    def current_user_orders
        @orders = Order.get_current_user_orders(current_user.id).paginate(page: params[:page], per_page: 5)
    end

end
