class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_post, only: [:index, :create, :show]

  def index
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

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
