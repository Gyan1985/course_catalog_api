Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :verticals
      resources :categories
      resources :courses
      post '/oauth/applications', to: 'oauth_applications#create'
      post '/oauth/tokens', to: 'oauth_tokens#create'
    end
  end
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
end
