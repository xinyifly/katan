Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :polls, only: [:index] do
    resources :candidates, only: [:index]
  end
  resources :votes, only: [:create, :new, :show]
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
