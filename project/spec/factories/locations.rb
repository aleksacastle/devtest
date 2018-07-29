FactoryBot.define do
  factory :location do
    name 'location'
    external_id { SecureRandom.uuid }
    secret_code { SecureRandom.hex(64) }
    country_id 1
    panel_provider_id 1
  end
end
