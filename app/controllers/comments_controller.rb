class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_post, except: :new
  before_action :set_comment, only: [:show, :edit, :update]

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
  end

  def edit
    unless current_user.id == @comment.user_id 
      redirect_to post_path(@post)
    end
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to post_comment_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    unless current_user.id == comment.user_id 
      redirect_to post_path(@post)
    else
      comment.destroy
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
