Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'api/v1/login', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do
      scope :users do
        post '/', to: "users#create"
        get ':Username', to: "users#show"
        put ':Username', to: "users#update"
        delete ':Username', to: "users#destroy"
      end
    end
  end
end
