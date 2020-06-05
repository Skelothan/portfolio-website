Rails.application.routes.draw do
  resources :uploaded_files
  resources :users
  resources :file_projects
  resources :links
  resources :tag_projects
  resources :tags
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
