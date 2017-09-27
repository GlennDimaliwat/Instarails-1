Rails.application.routes.draw do
  root 'feed#index'
  resources :photos do
    resources :comments # /photos/:photo_id/comments
    member do
      resource :photo_like, path: 'like', only: [:update]
    end
    # PATCH /photos/:id/like
  end
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
