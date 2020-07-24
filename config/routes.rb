Rails.application.routes.draw do
  # Semi-static routes
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout

  # Resource routes
  resources :sessions
  resources :uploaded_files
  resources :users
  resources :file_projects
  resources :links
  resources :tag_projects
  resources :tags
  resources :projects
  

end
