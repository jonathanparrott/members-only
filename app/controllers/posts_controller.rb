class PostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    current_user
    params[:post][:user_id] = @current_user.id
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  
  end

  def index
    @posts = Post.all
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end


end
