Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :onsens, only: [:index, :show] do
    resources :reviews,only: [:index,:create]  
  end
  resources :reviews, only: [:destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end  
