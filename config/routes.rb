Rails.application.routes.draw do
  root to: "static#home"
  namespace :api do
    namespace :v1 do
      resources :activity_timers
      resources :users
      post '/login' => "sessions#create"
      get '/login' => "sessions#test"
      get '/logged_in' => "sessions#logged_in"
      delete '/logout' => "sessions#delete"
    end
  end
end
