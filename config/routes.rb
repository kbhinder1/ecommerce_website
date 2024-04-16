Rails.application.routes.draw do
  devise_for :users

  devise_for :admins

  get "up" => "rails/health#show", as: :rails_health_check

  get 'checkout', to: 'checkout#show', as: :checkout_show
  post 'checkout/create', to: 'checkout#create', as: :checkout_create

  resource :cart, only: [:show] do
    post 'add_item'
    post 'remove_item'
    post 'update_item'
  end

  resources :products do
    post 'add_item_to_cart', to: 'carts#add_item'
  end

  resources :orders, only: [:index, :show] 
  
  authenticate :admin do
    namespace :admin do
      resources :products
      resources :categories
      resources :static_pages, only: [:edit, :update]

      get 'dashboard/index', as: :dashboard_index
      root to: "dashboard#index"
    end
  end
end
