Rails.application.routes.draw do
  resources :books do
    resources :reviews, only: [ :create, :destroy ]
  end

  root "books#index"
end
