RailsTableEditor::Application.routes.draw do
  resources :customers
  root to: 'customers#index'
end
