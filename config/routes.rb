Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
  root to: "items#index"
  resources :furimas, only: :index 
  resources :users, only: :show
end
