class PostsController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @current_user = current_user
    @user = User.find_by_id(params[:user_id])
    @post = Post.includes(:comments).find_by_id(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.author_id = @user.id

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post created successfully!'
    else
      redirect_to user_posts_path(@user), alert: 'Failed to create the post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
