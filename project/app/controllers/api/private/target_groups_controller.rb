module Api::Private
  class TargetGroupsController < Api::Private::BaseController
    def index
      if target_groups.nil?
        render "No Target Groups was found for given country"
      else
        render json: target_groups, each_serializer: TargetGroupSerializer
      end
    end

    private

    def country_code
      Country.find_by(params[:country_code])
    end

    def panel_provider
      country_code.panel_provider_id
    end

    def target_groups
      target_groups = TargetGroup.where(panel_provider_id: panel_provider)
    end
  end
end
