Rails.application.routes.draw do
  get 'responses/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'projects#index'
  resources :projects
  resources :audios do
    member do
      get:download
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
