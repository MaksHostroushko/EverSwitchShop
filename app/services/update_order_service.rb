class UpdateOrderService < Patterns::Service
  def initialize(order, status, order_params)
    @order = order
    @status = status
    @order_params = order_params
  end

  def call
    if @status == 'canceled'
      @order.status_canceled!
      'Order canceled'
    else
      @order.update(@order_params)
      @order.status_ordered!

      'Order confirmed'
    end
  end
end