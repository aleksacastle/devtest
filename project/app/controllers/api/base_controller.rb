module Api
  class BaseController < ActionController::API
    include ActionController::Serialization

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :bad_request

    private

    def not_found
      render json: {
        error_message: "Not found"
      }, status: :not_found
    end

    def bad_request
      render json: {
        error_message: "Something wrong"
      }, status: :bad_request
    end
  end
end
