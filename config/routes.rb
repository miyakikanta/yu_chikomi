Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/onsens/rank'

  resources :onsens, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :reviews, only: [:destroy,:edit, :update]
  
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
 
  get '/homes/mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end   
 