Rails.application.routes.draw do
resources :flights do
  collection do
    get :search, to: "flights#search"
  end
end
root 'flights#index'
resources :bookings
end

