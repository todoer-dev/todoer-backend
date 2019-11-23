class ApplicationController < ActionController::API
  private

  def current_user
    @current_user ||= Authentication::AuthenticateUser.new.call(headers: request.headers) do |result|
      result.success(&:yield_self)
      result.failure { |_error| AnonymousUser.instance }
    end
  end

  def require_authentication
    return unless current_user.anonymous?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
