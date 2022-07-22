Rails.application.routes.draw do
  devise_for :users
  resources :categories
  root "posts#index"
  
  resources :posts do
    resources :comments
  end

end
