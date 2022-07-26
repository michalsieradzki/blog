Rails.application.routes.draw do
  devise_for :users
  resources :categories
  root "posts#index"
  resources :comments
  resources :posts do
    resources :comments
  end

end
