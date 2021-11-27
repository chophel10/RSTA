Rails.application.routes.draw do
  resources :complains do
    resources :comments
  end
  root "complains#index"
  devise_for :users
  resources :assigns
  get "account/index", to: "account#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
