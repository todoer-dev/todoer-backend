# frozen_string_literal: true

module Authentication
  class AuthenticateUser
    include Dry::Transaction

    step parse_auth_header
    step decode_token
    step authenticate_user

    private

    def parse_auth_header(input)
      auth_header = input[:headers]['Authorization']
      token = auth_header && auth_header.split(' ').last

      if token.present?
        Success({ token: token })
      else
        Failure('Token is missing')
      end
    end

    def decode_token(input)
      token_payload = JsonWebToken.decode(input[:token])

      if token_payload.present?
        Success({ token_payload: token_payload })
      else
        Failure('Invalid token')
      end
    end

    def authenticate_user(input)
      user = User.find_by(id: input[:token_payload][:user_id])

      if user.present?
        Success(user)
      else
        Failure('Invalid token')
      end
    end
  end
end
