Rails.application.routes.draw do
  root to: 'github#index'
  post '/show', to: "github#show"

  resources :animals
end
