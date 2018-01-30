Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :trusts, only: [:new, :create]
  resources :reports, only: [:new, :create]

  root to: "posts#index"
end
