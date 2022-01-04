Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # dashboard
  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#profile", as: :profile
  get "/posts/show/:post_id" => "posts#show", as: :show
  get "/post/like/:post_id" => "likes#save_like", as: :like_post
  post "/follow/account" => "accounts#follow_account", as: :follow_account
  resources :posts, only:[:new,:create]
  resources :comments, only: [:create]
  
  root to: 'public#homepage'
  # Defines the root path route ("/")
  # root "articles#index"
end
