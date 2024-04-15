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
    redirect_to customer_path(current_customer)
  end

  def confirm_withdraw
  end

  def withdraw
    @customer = current_customer
    @customer.update!(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def get_favorites
    @customer = Customer.find(params[:id])
    get_favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(get_favorites)
    @post = Post.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email)
  end
end