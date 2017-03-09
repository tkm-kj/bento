class Admin::OrdersController < Admin::ApplicationController
  def close
    order = Order.find(params[:order_id])

    if order.update(closed_at: Time.zone.now)
      redirect_to admin_order_order_items_path(order, notice: '注文を締め切りました')
    else
      redirect_to admin_order_order_items_path(order, alert: '注文を締め切れませんでした')
    end
  end
end
