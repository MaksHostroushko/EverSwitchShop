Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "products#index"
  resources :products do
    resources :order_items, only: %i[create update destroy]
  end
  resources :orders
end
