Rails.application.routes.draw do
  scope module: :web do
    root "welcome#index"

    resources :products
    resources :users
    resource :sessions, only: [:new, :create, :destroy]

    get "signin" => "sessions#new"
    post "signin" => "sessions#create"
    delete "signout" => "sessions#destroy"

    get "signup" => "users#new"
    post "signup" => "users#create"
  end
end
