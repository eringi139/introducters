class Admin::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def search
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comment = PostComment.new
  end
end
