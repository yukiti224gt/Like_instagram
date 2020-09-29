Rails.application.routes.draw do
  devise_for :users
  # pagesコントローラーのhomeアクションのルーティングを追加する
  root 'pages#home'
end
