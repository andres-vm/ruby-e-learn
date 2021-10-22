Rails.application.routes.draw do
  
  resources :enrollments do
    get :my_students, on: :collection
  end
  devise_for :users
  
  resources :courses do
    get :purchased, :pending_review, :created, on: :collection
    resources :lessons
    resources :enrollments, only: [:new, :create]
  end
  
  resources :users, only: [:index, :edit, :show, :update]
  root 'static_pages#landing_page'
  
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'activity', to: 'static_pages#activity'
  get 'analytics', to: 'static_pages#analytics'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
