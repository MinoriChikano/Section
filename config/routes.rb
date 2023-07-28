Rails.application.routes.draw do
  get 'audios/index'
  get 'audios/new'
  get 'audios/show'
  get 'audios/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'projects#index'
  resources :projects
  resources :audios
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
