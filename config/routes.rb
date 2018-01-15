Rails.application.routes.draw do
  devise_for :users
  root to: 'home#show'

  resources :drafts
  resource  :journal
end
