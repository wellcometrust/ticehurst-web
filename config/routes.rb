Rails.application.routes.draw do


  resources :patients, only: [:show, :index, :edit, :update]

  resources :records, only: [:show, :index] do

    resource :pages, only: [:show], controller: :records, action: :pages
    resource :pages, only: [:show, :update], controller: :records, action: :update_pages

  end

  root to: "home#show"

end
