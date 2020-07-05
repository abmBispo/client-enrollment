Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :clients, only: %i[index create]
      resources :tags, only: %i[create]
    end
  end
end
