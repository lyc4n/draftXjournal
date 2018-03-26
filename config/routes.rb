Rails.application.routes.draw do
  devise_for :users
  root to: 'home#show'

  resources :drafts
  resource  :journal do
    get '/:month/:day', to: 'journals#show'

    # scope module: :journal do
    #   resources  :month_entries, only: :show, param: :month
    #   resources  :entries,       only: :show, param: :day
    # end
  end
end
