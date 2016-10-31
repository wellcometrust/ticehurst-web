Rails.application.routes.draw do


  resources :patients, only: [:show, :index]

  root to: "home#show"

end
