class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comments_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
  private

  def comments_params
    params.require(:comments).permit(:comment)
  end
end
