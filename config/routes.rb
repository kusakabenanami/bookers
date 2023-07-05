Rails.application.routes.draw do
  resources :lists
  get 'books/top'
  get 'books' => 'books#index'
  get 'homes/top'
  root to: 'homes#top'
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
