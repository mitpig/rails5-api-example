Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'api/v1/login', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do
      resources :users, constraints: { username: /[0-z\.]+/ }, param: :username
    end
  end
end
