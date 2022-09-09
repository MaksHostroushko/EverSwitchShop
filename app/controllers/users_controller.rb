class UsersController < ApplicationController
  def show; end

  def order_items
    @orders = current_user.orders
  end
end
