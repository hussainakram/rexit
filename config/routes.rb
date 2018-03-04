Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :bags
end
