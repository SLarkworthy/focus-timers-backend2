if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_focus-timer-app', same_site: :none, secure: true
else
    Rails.application.config.session_store :cookie_store, key: '_focus-timer-app', same_site: :none, secure: true
end