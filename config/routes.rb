Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'projects#index'
  resources :projects
  resources :audios do
    member do
      get:download
    end
    resources :responses do
      member do
        get:download
      end
    end
  end
  resources :joins, only: [:new, :create]
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
