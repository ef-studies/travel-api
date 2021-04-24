Rails.application.routes.draw do
  resources :travels, only: [:index, :create]
end
