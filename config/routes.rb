CrmRails::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers
    end
  end

  resources :customers

  root to: 'customers#index'

  match '*path', to: 'application#options', via: :options
end
