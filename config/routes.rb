Rails.application.routes.draw do
  get 'notices/index'
  get 'notices/new_parent'
  get 'notices/new_staff'
  get 'notices/create'
  get 'notices/edit'
  get 'notices/update'
  get 'student_histories/index'
  devise_for :users
  root 'home#index'

  resources :students do
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
