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

  # NOTE: 管理画面の機能はこのnamespaceに追加する
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
    resources :committees, param: :slug, only: %i[index edit update new create destroy] do
      post :create_preview, on: :collection
      post :update_preview, on: :member
    end
    resource :fibonacci_number, path: :fibonacci, only: %i[show]
  end

  resources :articles, only: %i[index show]

  resources :bureaus, param: :slug, only: :show

  resources :committees, param: :slug, only: :show

  namespace :event_cart do
    root to: 'carts#index'
    resources :carts, param: :unique_code, only: %i[show edit create update destroy]
  end

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
    resource :positive_impression, only: %i[show create]
  end
end
