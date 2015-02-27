Salesforce::Application.routes.draw do
  root :to => "filters#index"

  resources :labels
  resources :filters
  resources :cases

end
