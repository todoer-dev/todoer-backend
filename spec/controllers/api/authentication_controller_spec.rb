# frozen_string_literal: true

describe API::AuthenticationController do
  let(:user) { create(:user, password: password) }
  let(:password) { Faker::Internet.password }

  describe "POST #create" do
    it "responds with auth_token when correct params are provided" do
      post :create, params: { email: user.email, password: password }

      payload = JSON(response.body)

      expect(response).to have_http_status(200)
      expect(payload).to include('auth_token')
    end

    it "denies access when incorrect params are given" do
      post :create, params: { email: user.email, password: "incorrect password" }

      payload = JSON(response.body)

      expect(response).to have_http_status(401)
      expect(payload).to include('error')
    end
  end
end
