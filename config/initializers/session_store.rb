if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_focus-timer-app'
else
    Rails.application.config.session_store :cookie_store, key: '_focus-timer-app' 
end