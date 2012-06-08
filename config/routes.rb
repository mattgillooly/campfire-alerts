CampfireAlerts::Application.routes.draw do

  resources :links, only: [:index]

  resources :postmark_callbacks, only: [:create]

  root to: 'links#index'

end
