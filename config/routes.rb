Rails.application.routes.draw do
  resources :comments
   resources :issues
  resources :projects do
    resources :issues do
      resources :comments
    end
  end
  resources :users, only: [:index] do
    member do
      patch :resend_invitation
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
