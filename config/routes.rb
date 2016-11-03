Rails.application.routes.draw do


  resources :patients, only: [:show, :index, :edit, :update]

  resources :records, only: [:show, :index] do

    resource :pages, only: [:show], controller: :records, action: :pages
    resource :pages, only: [:update], controller: :records, action: :update_pages


    resource :index, only: [:show], controller: :records, action: :index_pages, as: 'index' do
      resources :index_page, only: [:show], controller: :records, action: :index_page, path: '', as: 'page'
      resources :index_page, only: [:update], controller: :records, action: :update_index_page, path: '', as: 'page'
    end
  end

  root to: "home#show"

end
