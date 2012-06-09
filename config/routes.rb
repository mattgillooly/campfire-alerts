CampfireAlerts::Application.routes.draw do

  resources :emails, only: [:index, :show]

  resources :links, only: [:index]

  resources :postmark_callbacks, only: [:create]

  root to: 'links#index'

end
