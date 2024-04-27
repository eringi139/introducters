class Admin::PostsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_name]
      genre = Genre.find_by(name: params[:genre_name])
      @post = genre.posts
    else
      @post = Post.order(created_at: :desc)
    end
    
  end

  def search
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comment = PostComment.new
  end
end
