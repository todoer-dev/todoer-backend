# frozen_string_literal: true

class JsonWebToken
  EXPIRATION_TIME = 24.hours

  class << self
    def encode(payload, exp = EXPIRATION_TIME.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base).first
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
