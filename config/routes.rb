Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:index, :create] do
        collection do
          delete :destroy
        end
      end
      resources :users do
        collection do
          post 'signup', to: 'users#create'
        end
      end
    end
  end
end
