Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: "registrations" }
  # pagesコントローラーのhomeアクションのルーティングを追加する
  root 'pages#home'

  get "/users/:id",to: "users#show", as: "user"
  
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
  # asオプションを用いるとルーティングへ名前を付けれる。今回userという名前をつけたためuser_pathメソッドが生成される。
  

end
