Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :posts

  resources :trusts, only: [:create]
  resources :reports, only: [:create]

  resources :users, only: [:show] do
    get :posts

  end

end
