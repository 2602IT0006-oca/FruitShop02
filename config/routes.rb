# config/routes.rb

Rails.application.routes.draw do

  # 省略

  # 商品関連
  resources :products

  # 注文関連
  resources :orders, only: [:index, :new, :create] do 
    collection do
      post :confirm   # 注文確認
    end

    member do
      get :complete  # 注文完了
    end
  end
  
  # 省略
  
end