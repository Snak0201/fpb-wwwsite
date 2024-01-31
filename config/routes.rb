Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#top"
  get "about" => "pages#about"
  get "links" => "pages#links"

  namespace :tools do
    resource :character_counter, only: %i[show create]
  end

  resources :articles, only: %i[show]

  resources :admins, only: %i[index], path: Rails.application.credentials.admin[:PATH], as: "admin"
  devise_for :admin, path: Rails.application.credentials.admin[:PATH]

  namespace :admins, path: Rails.application.credentials.admin[:PATH], as: "admin"  do
    resources :articles
  end
end
