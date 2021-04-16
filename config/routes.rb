Rails.application.routes.draw do
  devise_for :users
  get 'dashboards/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'dashboards#index'
  resources :users do
    resources :exercises
  end
end
