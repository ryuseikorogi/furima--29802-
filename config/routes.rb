Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  #get 'posts', to: 'posts#index'
  root to: "items#index"
end

