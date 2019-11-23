# frozen_string_literal: true

module API
  class AuthenticationController < ApplicationController
    def create
      Authentication::GenerateTokenForUser.new.call(email: params[:email], password: params[:password]) do |result|
        result.success do |token|
          render json: { auth_token: token }
        end

        result.failure do |error_message|
          render json: { error: error_message }, status: :unauthorized
        end
      end
    end
  end
end
