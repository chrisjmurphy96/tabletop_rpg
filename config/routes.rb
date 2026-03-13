Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  post "users/create"
  post "players/update"
  get "players/get"
  get "players/get_page"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # TODO: This works, but there's gotta be a better way to write this.
  # Need to figure out how to either route directly to the application_controller
  # or move everything to home maybe. Right now the home html is empty, all
  # the angular setup is in the application html.
  root "home#index"
end
