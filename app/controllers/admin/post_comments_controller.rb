class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.all
    @customers = Customer.all
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_posts_path
  end
end
