class Public::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to posts_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def search
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :genre_id)
  end
end
