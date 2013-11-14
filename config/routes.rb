RailsTableEditor::Application.routes.draw do
  namespace :api do
    resources :customers
  end

  resources :customers

  root to: 'customers#index'

  match '*path', to: 'application#options', via: :options
end
