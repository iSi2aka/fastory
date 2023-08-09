class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update ]

  def index
    @post = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user.id == @post.user_id 
      redirect_to root_path
    end
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    unless current_user.id == post.user_id 
      redirect_to root_path
    else
      post.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post)
          .permit(:title, :disease, :name, :age, :sex_id, :family, 
                  :airway, :breathing, :circulation, :dysfunction_cns, :exposure,
                  :symptom, :allergy, :medicine, :past_history, :last_meal, :event, :risk_factor, :others, 
                  :story, :point, :image)
          .merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
