module Api::Private
  class BaseController < Api::BaseController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    private

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by(token: auth_token)
      end
    end

    def render_unauthorized
      render json: {
        error_message: "Bad credentials"
      }, status: :unauthorized
    end
  end
end
