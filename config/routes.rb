Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: "registrations" }
  # pagesコントローラーのhomeアクションのルーティングを追加する
  root 'posts#index'

  get "/users/:id",to: "users#show", as: "user"
  
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)

    resources :likes, only: %i(create destroy)

    resources :comments, only: %i(create destroy)
  end
  # asオプションを用いるとルーティングへ名前を付けれる。今回userという名前をつけたためuser_pathメソッドが生成される。
end
