Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :admin do
    resources :parent_users, only: %i[index edit update create destroy new]
  end

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
