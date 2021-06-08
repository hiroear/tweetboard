Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users
  resources :tweets, only: %i[index create edit update destroy] do
    resource :likes, only: %i[create destroy]
  end

  namespace :tweets do
    resources :mines, only: %i[index]
    resources :likes, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
