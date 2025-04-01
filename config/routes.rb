Rails.application.routes.draw do
  # Root route to the books index page
  root "books#index"

  # RESTful routes for books, including nested routes for reviews
  resources :books do
    # Nested resources for reviews under books
    resources :reviews, only: [ :create, :destroy ]
  end
end
