Rails.application.routes.draw do
  get 'post/index'
  root to: "post#index"
end
