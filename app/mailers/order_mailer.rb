class OrderMailer < ApplicationMailer

  def order_placed_email
    @user = params[:user]
    @order = params[:order]
    @travel_detail = params[:travel_detail]

    mail(to: @travel_detail.user.email, subject: 'Order placed on your service')
  end

end
