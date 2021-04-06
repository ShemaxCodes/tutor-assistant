Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"
  

  get "/signup", to: "users#new", as: 'new_user_path'
  get "/login", to: "sessions#new", as: 'login_path'
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout_path'
  get '/logout', to: "sessions#destroy"

  get '/auth/google_oauth2/callback', to: "sessions#google_login"

  resources :users 
  resources :assignments

  resources :users, only: [:show] do #nested resource for assignments
    resources :assignments, only: [:show, :index] #shows entire list of assignments and indiv assignments
  end 

end
