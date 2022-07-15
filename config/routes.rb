Rails.application.routes.draw do
  root "news#index"

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end

  get '*path', to: 'news#index', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
