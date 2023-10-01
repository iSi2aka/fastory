Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "posts#index"
  resources :posts do
    collection do
      get 'search'
    end
    resources :comments
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
