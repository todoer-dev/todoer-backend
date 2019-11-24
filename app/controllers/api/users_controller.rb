# frozen_string_literal: true

module API
  class UsersController < ApplicationController
    PERMITTED_PARAMS = [:email, :password]

    def create
      user = User.create(user_params)

      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(*PERMITTED_PARAMS)
    end
  end
end
