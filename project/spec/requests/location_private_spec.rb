require 'rails_helper'

describe 'api/private/locations/:country_code', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:location) { FactoryBot.create!(:location)}

  describe 'GET #index' do
    def trigger
      country_code = "pl"
      get "/api/private/locations/'#{country_code}'", headers: { 'Authorization': "Bearer #{user.auth_token}" }
    end

    def trigger_without_token
      country_code = "pl"
      get "/api/private/locations/'#{country_code}'"
    end

    it 'returns unauthorized error' do
      trigger_without_token

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns http success' do
      trigger

      expect(response).to have_http_status(:success)
    end
  end
end
