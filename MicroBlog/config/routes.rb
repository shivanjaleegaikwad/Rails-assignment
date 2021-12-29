Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs do
    member do
      get :publish
    end
    resources :comments
  end
end
