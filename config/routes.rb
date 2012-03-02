ShoppingEmber::Application.routes.draw do
  resources :products
  get "women" => "home#index"
  get "men" => "home#index"
  root :to => "home#index"
end