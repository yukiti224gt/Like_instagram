class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post

    if @comment.save
      respond_to :js
    else
      flash[:alert] = "コメントに失敗しました"
    end
end

private 
  def comment_params
    params.required(:comment).permit(:user_id, :post_id, :comment)
  end
end

