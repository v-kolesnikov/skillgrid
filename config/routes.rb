Rails.application.routes.draw do
  scope module: :web do
    root "welcome#index"

    resources :products
    resources :users
  end
end
