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
    resources :bureaus, param: :slug, only: %i[index edit update]
  end

  resources :articles, only: %i[index show]

  resources :tools, only: %i[index]
  namespace :tools do
    resource :character_counter, only: %i[show create]
    resource :stamina_calculator, only: %i[show create] do
      collection do
        get :stamina, to: 'stamina_calculators#show_stamina', path: 'stamina_from_time'
        post :stamina, to: 'stamina_calculators#create_stamina', path: 'stamina_from_time'
      end
    end
  end
end
