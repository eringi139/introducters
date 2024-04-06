class Admin::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def search
  end

  def show
  end
end
