Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"

  resources :athletes, only: :index do
    collection do
      post :search, to: 'athletes#search'
    end
  end

  namespace :dashboard do
    root to: "dashboard#index"
    resources :exercises, except: :index
  end
end
