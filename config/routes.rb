Rails.application.routes.draw do
  devise_for :users
  get 'post/index'
  root to: "post#index"
end
