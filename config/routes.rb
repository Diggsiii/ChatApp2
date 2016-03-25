Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end
  # You can have the root of your site routed with "root"
  root "conversations#index"
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
end
