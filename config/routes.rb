Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#newSendingDestination'

    post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  end

  

  root to: 'items#index'
  resources :items do
    resources :orders
 end
end