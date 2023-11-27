Rails.application.routes.draw do
  devise_for :users
  root 'home#index'


    resources :user_attendances


  resources :students do
    resources :student_attendances, controller: 'student_attendances'
  end

  resources :students do
    collection do
      get 'get_sections'
    end
    member do
      patch :active_student
    end
  end

  resources :standards, except: %i[show new] do
    resources :sections, only: []
  end

  namespace :admin do
    resources :admin_users, only: %i[edit update] do
    end
  end

  namespace :admin do
    resources :parent_users, except: [:show] do
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
