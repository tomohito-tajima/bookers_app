Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :books
  post 'books/:id' => 'books#create' #削除可
end
