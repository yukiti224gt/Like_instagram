class PostsController < ApplicationController

  before_action :authenticate_user!
  # もしログインしていないならサインインページへリダイレクトされる
  before_action :set_post, only: %i(show destroy)
  
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

  def index
    @posts = Post.limit(10).order("created_at DESC")
  end
  # 投稿のレコードは最大10個,降順に出力

  def show
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"  
    end
    redirect_to root_path
  end
  
  private
    def post_params
      params.require(:post).permit(:caption,photos_attributes: [:image])
      .merge(user_id: current_user.id)
    end


  def set_post
    @post = Post.find_by(id: params[:id])
  end
  
    # paramsとは送られたリクエスト情報をひとまとめにしたもの
end
