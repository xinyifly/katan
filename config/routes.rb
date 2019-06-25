Rails.application.routes.draw do
  resources :polls, only: [:index]
  resources :votes, only: [:create, :new, :show]
  resources :candidates, only: [:index]
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
