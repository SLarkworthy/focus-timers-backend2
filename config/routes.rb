Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show] do
        resources :activity_timers, only: [:index]
      end
        resources :activity_timers, only: [:index, :create, :show, :update, :destroy]
      post '/login' => "sessions#create"
      get '/login' => "sessions#test"
      get '/logged_in' => "sessions#logged_in"
      delete '/logout' => "sessions#delete"
    end
  end
end
