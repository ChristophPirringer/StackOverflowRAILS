class PostsController < ApplicationController

  before_filter :authorize, only: [:edit, :update, :destroy, :new, :create]
  def index
    @posts = Post.all
    @upvote = Upvote.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post successfully added!"
      redirect_to  posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post successfully deleted!"
    redirect_to posts_path
  end

  private
    def post_params
    params.require(:post).permit(:name, :author, :content)
  end

end
