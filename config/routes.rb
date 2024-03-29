Rails.application.routes.draw do
  resources :admins do
    collection do
      post :gates
      post :keys
      post :create_key
    end
  end

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
      resources :gates do
          resources :keys
      end
    end
  end
end
