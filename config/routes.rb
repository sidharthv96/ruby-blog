Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
