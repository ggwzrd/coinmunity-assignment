Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :posts
  resources :tags, only: [:index]


  resources :trusts, only: [:create]
  resources :reports, only: [:create]
  resources :comments, only: [:create]
  resources :sources, only: [:index]
  resources :profiles, only: [:create, :show, :update]

  resources :users, only: [:show] do
    get :posts


  end
  # mount ActionCable.server, at: '/cable'
end
