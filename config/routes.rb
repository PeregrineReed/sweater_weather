Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: [:show]
      resource :backgrounds, only: [:show]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resource :favorites, only: [:create, :show, :destroy]
    end
  end
end
