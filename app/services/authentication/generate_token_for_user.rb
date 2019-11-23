# frozen_string_literal: true

module Authentication
  class GenerateTokenForUser
    include Dry::Transaction

    step find_and_authenticate
    map generate_token

    private

    def find_and_authenticate(input)
      user = User.find_by(email: input[:email])
      is_valid = user && user.authenticate(input[:password])

      if is_valid
        Success({ user: user })
      else
        Failure("Invalid credentials")
      end
    end

    def generate_token(input)
      JsonWebToken.encode(user_id: input[:user].id)
    end
  end
end
