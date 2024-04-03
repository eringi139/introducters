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
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def edit
    @post = current_customer
  end

  def update
    post = current_customer
    post.update(post_params)
    redirect_to post_path
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
