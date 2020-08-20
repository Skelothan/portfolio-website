Rails.application.routes.draw do
  # Semi-static routes
  get "index", to: "home#index", as: :home
  get "about", to: "home#about", as: :about
  get "contact", to: "home#contact", as: :contact
  get "privacy", to: "home#privacy", as: :privacy
  get "search", to: "home#search", as: :search
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  get "errors/404", to: "errors#error_404", as: :error_404

  get "gamedev", to: "projects#index_gamedev", as: "gamedev"
  get "webdev", to: "projects#index_webdev", as: "webdev"
  get "gameaudio", to: "projects#index_gameaudio", as: "gameaudio"
  

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

  root "home#index"

end
