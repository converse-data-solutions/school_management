Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :standards, only: %i[]

  resources :standards, only: %i[create] do
    resources :sections, only: %i[]
  end
  namespace :admin do
    resources :admin_users do
      member do
        patch 'update_password'
      end
    end
  end

  namespace :admin do
    resources :parent_users do
      member do
        patch :active_user
      end
    end
  end
  namespace :admin do
    resources :staff_users do
      member do
        patch :active_staff_user
      end
    end
  end
end
