FactoryBot.define do
  factory :user do
    name 'user'
    password 'password'

    auth_token 'SecureRandom'
  end
end
