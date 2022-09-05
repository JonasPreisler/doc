Rails.application.routes.draw do
  resources :documents
  root to: "pages#home"
end
