Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#top"
  get "about" => "pages#about"
  get "links" => "pages#links"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "graphql", to: "graphql#execute"

  resources :admins, only: %i[index], path: Rails.application.credentials.admin[:PATH], as: "admin"
  devise_for :admin, path: Rails.application.credentials.admin[:PATH]

  namespace :admins, path: Rails.application.credentials.admin[:PATH], as: "admin"  do
    resources :articles do
      member do
        post :preview
        patch :toggle_published
        post :restore_previous_version
      end
    end
    resource :announcement, only: %i[new create] do
      post :preview, on: :member
    end
    resources :bureaus, param: :slug, only: %i[index edit update] do
      post :preview, on: :member
    end
    resource :fibonacci_number, path: :fibonacci, only: %i[show]
  end

  resources :articles, only: %i[index show]

  resources :bureaus, param: :slug, only: :show

  resources :tools, only: %i[index]
  namespace :tools do
    resource :character_counter, only: %i[show create]
    resource :stamina_calculator, only: %i[show create] do
      collection do
        get :stamina, to: 'stamina_calculators#show_stamina', path: 'stamina_from_time'
        post :stamina, to: 'stamina_calculators#create_stamina', path: 'stamina_from_time'
      end
    end
    resource :dice, only: %i[show create]
    resource :positive_impression, only: %i[show]
  end
end
