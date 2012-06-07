CampfireAlerts::Application.routes.draw do

  resources :postmark_callbacks, only: [:create]

end
