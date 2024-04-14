class Public::PostsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_name]
      genre = Genre.find_by(name: params[:genre_name])
      @post = genre.posts
    else
      @post = Post.all
    end
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
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def search
    #@customers = Customer.looks(params[:search], params[:word])
    @posts = Post.looks(params[:word])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :genre_id)
  end
end
