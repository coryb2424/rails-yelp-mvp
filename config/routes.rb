Rails.application.routes.draw do
  resources :restaurants, except: %i[update edit destroy] do
    resources :reviews, only: %i[new create]
  end
  root 'restaurants#index'
end
