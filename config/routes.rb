Rails.application.routes.draw do
  # Semi-static routes
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  get 'errors/404', to: "errors#error_404", as: :error_404

  # Resource routes
  resources :sessions
  resources :uploaded_files
  resources :users
  resources :file_projects
  resources :links
  resources :tag_projects
  resources :tags
  resources :projects
  
  match '*path' => 'errors#error_404', via: :all
  
end
