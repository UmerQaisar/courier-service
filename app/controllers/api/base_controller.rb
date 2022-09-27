module Api
  class BaseController < ApplicationController
    include JsonWebToken
    before_action :verify_authenticity_token

    def verify_authenticity_token
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = jwt_decode(header)
      @current_user = User.find_by_id(decoded[:user_id])
    end
  end
end