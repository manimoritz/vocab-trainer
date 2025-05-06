Rails.application.routes.draw do
  root "verbs#index"

  resources :verbs do
    member do
      post "check_conjugation"

      get "check_conjugation", to: "show"
    end
  end

  post 'forms/create_bulk', to: 'forms#create_bulk', as: :create_forms

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
