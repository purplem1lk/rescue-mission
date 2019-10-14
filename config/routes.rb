Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users

  resources :questions, only: [:index, :show, :new, :create] do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers, only: [:show, :update, :edit, :destroy]
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
