PANEL_PROVIDERS_CODES = %w[times_a 10_arrays times_html].freeze

COUNTRIES = [
  { code: "PL", panel_provider_code: "times_a" },
  { code: "US", panel_provider_code: "10_arrays" },
  { code: "UK", panel_provider_code: "times_html" }
].freeze

LOCATIONS = [
  { name: "New York", country_code: "US" },
  { name: "Los Angeles", country_code: "US" },
  { name: "Chicago", country_code: "US" },
  { name: "Houston", country_code: "US" },
  { name: "Philadelphia", country_code: "US" },
  { name: "Phoenix", country_code: "UK" },
  { name: "San Antonio", country_code: "UK" },
  { name: "San Diego", country_code: "UK" },
  { name: "Dallas", country_code: "UK" },
  { name: "San Jose", country_code: "UK" },
  { name: "Austin", country_code: "PL" },
  { name: "Jacksonville", country_code: "PL" },
  { name: "San Francisco", country_code: "PL" },
  { name: "Indianapolis", country_code: "PL" },
  { name: "Columbus", country_code: "PL" },
  { name: "Fort Worth", country_code: "PL" },
  { name: "Charlotte", country_code: "PL" },
  { name: "Detroit", country_code: "PL" },
  { name: "El Paso", country_code: "PL" },
  { name: "Seattle", country_code: "PL" }
].freeze

PANEL_PROVIDERS_CODES.each { |panel_provider_code| PanelProvider.create!(code: panel_provider_code) }

COUNTRIES.each do |country|
  Country.create!(
    code: country.fetch(:code),
    panel_provider: PanelProvider.find_by!(code: country.fetch(:panel_provider_code))
  )
end

LOCATIONS.each do |location|
  Location.create!(
    name: location.fetch(:name),
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64),
    country_id: Country.find_by_code(location.fetch(:country_code))[:id],
    panel_provider_id: Country.find_by_code(location.fetch(:country_code))[:panel_provider_id]
  )
end

LOCATION_GROUPS = [
  [ "EEST", "PL", "times_a" ],
  [ "BST", "UK", "10_arrays" ],
  [ "EST", "US", "times_html" ],
  [ "PDT", "US", "times_html" ]
]
LOCATION_GROUPS.each do |name, country_code, panel_provider_code|
  LocationGroup.create!(name: name, country_id: Country.find_by_code(country_code)[:id], panel_provider_id: PanelProvider.find_by_code(panel_provider_code)[:id])
end

TARGET_GROUPS = [
  [ "target1", SecureRandom.uuid, SecureRandom.hex(64), "times_a"  ],
  [ "target2", SecureRandom.uuid, SecureRandom.hex(64), "10_arrays" ],
  [ "target3", SecureRandom.uuid, SecureRandom.hex(64), "times_html" ],
  [ "target4", SecureRandom.uuid, SecureRandom.hex(64), "times_a" ]
]
TARGET_GROUPS.each do |name, external_id, secret_code, code|
  TargetGroup.create!(name: name, external_id: external_id, secret_code: secret_code, panel_provider_id: PanelProvider.find_by_code(code)[:id])
end


User.create!(name: "admin", password: "password", auth_token: "PasSW0rd1")
