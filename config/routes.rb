# config/routes.rb

Rails.application.routes.draw do
  get "mypage/show"
  # ユーザ認証
  devise_for :users

  # マイページ
  resources :mypage, only: [:show]

  # 商品登録
  resources :products

  # 省略
  
  # トップページ
  root to: "homes#top"
end