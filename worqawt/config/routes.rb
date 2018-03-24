Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"

  namespace :dashboard do
    root to: "dashboard#index"
    resources :exercises
  end
end
