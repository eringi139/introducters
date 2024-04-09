class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @post = @customer.posts
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_path
  end

  def confirm_withdraw
  end

  def withdraw
  end
  
  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(likes)
    @post = Post.find(params[:id])
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email)
  end
end