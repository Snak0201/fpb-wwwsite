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

    resource :announcement, only: %i[new create] do
      post :preview, on: :member
    end
  end

  resources :articles, only: %i[index show]

  resources :tools, only: %i[index]
  namespace :tools do
    resource :character_counter, only: %i[show create]
    resource :stamina_calculator, only: %i[show create] do
      member do
        get :one
      end
    end
  end
end
