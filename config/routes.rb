Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root 'homes#top'

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  get 'home/about' => 'homes#about'



end
