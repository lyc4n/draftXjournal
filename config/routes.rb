Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'user_auth_callbacks'}
  root to: 'home#show'

  resources :drafts
  resources :fb_posts, only: [:index, :create]
end
