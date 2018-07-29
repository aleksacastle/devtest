module Api::Public
  class LocationsController < Api::BaseController
    def index
      render json: locations, each_serializer: LocationSerializer
    end

    private

    def country_code
      Country.find_by(params[:country_code])
    end

    def panel_provider
      country_code.panel_provider_id
    end

    def locations
      Location.where(panel_provider_id: panel_provider)
    end
  end
end
