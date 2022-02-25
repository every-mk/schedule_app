Rails.application.routes.draw do
  get '/', to: 'posts#index'

  resources :posts
end
