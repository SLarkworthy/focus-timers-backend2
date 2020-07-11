Rails.application.routes.draw do
  root to: "static#home"
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :activity_timers
      end
        resources :activity_timers
      post '/login' => "sessions#create"
      get '/login' => "sessions#test"
      get '/logged_in' => "sessions#logged_in"
      delete '/logout' => "sessions#delete"
    end
  end
end
