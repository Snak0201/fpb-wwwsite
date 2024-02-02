Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#top"
  get "about" => "pages#about"
  get "links" => "pages#links"

  resources :admins, only: %i[index], path: Rails.application.credentials.admin[:PATH], as: "admin"
  devise_for :admin, path: Rails.application.credentials.admin[:PATH]

  namespace :admins, path: Rails.application.credentials.admin[:PATH], as: "admin"  do
    resources :articles do
      patch :toggle_published, on: :member
    end
  end

  namespace :tools do
    resource :character_counter, only: %i[show create]
  end

  resources :articles, only: %i[show]

end
