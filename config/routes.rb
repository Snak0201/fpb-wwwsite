Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#top"
  get "about", to: "pages#about"
  get "links", to: "pages#links"
  get "tools/characters_count", to: "tools#characters_count"
  post "tools/characters_count", to: "tools#characters_count"
end
