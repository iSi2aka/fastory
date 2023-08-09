class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @post = Post.find(params[:id])
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
end
