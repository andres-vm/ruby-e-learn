Rails.application.routes.draw do
  
  devise_for :users
  resources :courses
  resources :users, only: [:index, :edit, :show, :update]
  root 'static_pages#landing_page'
  
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'static_pages/activity'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
