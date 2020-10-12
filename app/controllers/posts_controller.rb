class PostsController < ApplicationController

  before_action :authenticate_user!
  # もしログインしていないならサインインページへリダイレクトされる
  
  def new
    @post = Post.new
    @post.photos.build
    # new,buildはどちらもインスタンスを作るメソッドのこと
  end
  
  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿が失敗しました"  
    end
  end

  private
    def post_params
      params.require(:post).permit(:caption,photos_attributes: [:image])
      .merge(user_id: current_user.id)
    end
    # paramsとは送られたリクエスト情報をひとまとめにしたもの
end
