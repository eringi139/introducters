class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @posts = @customer.posts
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
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email)
  end
end
