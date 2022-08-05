class HomeController < ApplicationController

    def current_user_orders
        @orders = Order.get_current_user_orders(current_user.id)
    end

end
