Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  

  namespace :admin do
    get 'admin_users/edit'
    get 'admin_users/update'
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
