class Admin::PostCommentsController < ApplicationController
  def index
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def destroy
  end
end
