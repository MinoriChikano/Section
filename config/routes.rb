Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/new'
  get 'projects/edit'
  get 'projects/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
