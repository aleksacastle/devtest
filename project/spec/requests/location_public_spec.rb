require 'rails_helper'

describe 'api/public/locations/:country_code', type: :request do
  let(:location) { FactoryBot.create!(:location)}

  describe 'GET #index' do
    def trigger
      country_code = "pl"
      get "/api/public/locations/'#{country_code}'"
    end

    it 'returns http success' do
      trigger

      expect(response).to have_http_status(:success)
    end

    it 'renders correct response' do
      expect(response.content_type).to eq('application/json')
      json_body = JSON.parse(response.body)
      expect(json_body.count).to eq(1)
      expect(json_body[0]['name']).to eq(location.name)
    end
  end
end
