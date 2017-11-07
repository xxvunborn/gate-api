include ActionController::HttpAuthentication::Token::ControllerMethods
class ApplicationController < ActionController::API
  before_action :require_login

  def require_login
    authenticated_token || render_unauthorized('access denied')
  end

  def current
    @current ||= authenticated_token
  end

  protected

  def render_unauthorized message
    errors = { errors: [{ detail: message  }] }
    render json: errors, status: :unauthorized
  end

  private

  def authenticated_token
    authenticate_with_http_token do |token, options|
      if user = Session.with_unexpired_token(token, 2.days.ago)
        # Compare the tokens in a time-constant manner, to mitigate timing attacks
        ActiveSupport::SecurityUtils.secure_compare(
                       ::Digest::SHA256.hexdigest(token),
                       ::Digest::SHA256.hexdigest(user.token)
        )
        user
      end
    end
  end
end
