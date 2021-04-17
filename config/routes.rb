Rails.application.routes.draw do
  resources :travels, only: [:create]
end
