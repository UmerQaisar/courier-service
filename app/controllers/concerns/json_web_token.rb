require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern

  def jwt_encode(payload)
    JWT.encode(payload, ENV['SECRET_KEY'])
  end

  def jwt_decode(token)
    begin
    decoded = JWT.decode(token, ENV['SECRET_KEY'])[0]

    rescue JWT::VerificationError => e
      render json:{
        Error: "Unauthorized Request == #{e}"
      }
    end
    HashWithIndifferentAccess.new decoded
  end

end