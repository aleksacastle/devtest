module Api::Private
  class LocationsController < Api::Private::BaseController
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
