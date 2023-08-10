class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:index, :create]

  def index
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else 
      render :index, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_comment
    @post = Post.find(params[:post_id])
  end
end
