class OrdersController < ApplicationController
  def show
    @items = current_order.order_items.order(created_at: :asc)
  end

  def edit; end

  def update
    current_order.update(order_params)
    current_order.status_ordered!
    flash.alert = 'Order confirmed'
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:full_name, :email, :phone, :address)
  end
end