Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # dashboard
  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#profile", as: :profile
  get "/post/like/:postid" => "likes#save_like", as: :like
  resources :posts, only:[:new,:create,:show]
  
  root to: 'public#homepage'
  # Defines the root path route ("/")
  # root "articles#index"
end
