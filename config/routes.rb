Rails.application.routes.draw do


  resources :patients, only: [:show, :index]

  resources :records, only: [:show] do

    resource :pages, only: [:show], controller: :records, action: :pages

  end

  root to: "home#show"

end
