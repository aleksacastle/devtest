Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: :pages, action: :root

  scope '/api/public' do
    post 'evaluate_target', to: 'api/public/panel_providers#evaluate_target', as: 'evaluate_target'
  end

  api_routes = proc do
    get "/target_groups/:country_code", to: "target_groups#index"
    get "/locations/:country_code",     to: "locations#index"
    
    resources :locations, only: [:index]
    resources :target_groups, only: [:index]
  end

  namespace :api do
    namespace :private, &api_routes
    namespace :public, &api_routes
  end
end
