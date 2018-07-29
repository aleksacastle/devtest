module Api::Public
  class PanelProvidersController < Api::BaseController
    def evaluate_target
      render json: price
    end

    private

    def panel_params
      params.require(:panel_provider).permit(:country_code, :target_group_id, :locations )
    end

    def country_code
      code = params[:country_code]
      Country.find_by(code)
    end

    def panel_provider_id
      country_code.panel_provider_id
    end

    def panel_providers
      PanelProvider.where(id: panel_provider_id)
    end

    def price
      panel_providers.each do |panel_provider|
        PanelProvider.calculate_price(panel_provider.code)
      end
    end
  end
end
