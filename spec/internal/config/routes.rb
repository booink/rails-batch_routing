Rails.application.routes.draw do
  resources :articles, bulk: [:create, :update, :destroy]
end
