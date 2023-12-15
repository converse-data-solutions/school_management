Rails.application.routes.draw do
  get 'student_histories/index'
  devise_for :users
  root 'home#index'

  resources :schools, except: %i[index show destroy]

  resources :notices, except: %i[new show edit update]

  resources :students, except: %i[show] do
    collection do
      get :find_sections
      get :find_from_sections
      get :find_to_sections
      get 'promote'
      post 'update_sections'
    end
    member do
      patch :active_student
    end
  end

  namespace :parent do
    resources :parent_attendance_views
    resources :parent_notices
  end
  

  resources :user_attendances, except: %i[show edit update destroy create] do
    collection do
      post :update_all
    end
  end

  resources :student_attendances, except: %i[show new edit update destroy create] do
    collection do
      post :update_all
    end
    collection do
      get :find_sections
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
