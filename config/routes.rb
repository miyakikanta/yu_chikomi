Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
  devise_for :users
  root 'homes#top' 
  get '/onsens/rank'

  resources :onsens, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :reviews, only: [:destroy,:edit, :update]
   
  get '/homes/mypage'
  
  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end   
 