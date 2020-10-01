class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    # paramsとは送られてきたリクエスト情報をひとまとめにし、params[:パラメータ名]で取得
  end
