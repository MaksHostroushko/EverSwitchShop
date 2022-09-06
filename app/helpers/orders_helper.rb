module OrdersHelper
  def status_badge(order)
    order.status_ordered? ? 'bg-success' : 'bg-secondary'
  end
end
