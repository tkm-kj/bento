require 'idobata'

class Admin::OrdersController < Admin::ApplicationController
  def close
    order = Order.find(params[:id])
    order.close!

    if order.item_count_satisfied?
      Idobata.post("本日(#{I18n.l(order.date)})分の注文が成立しました:smiley:今日はお弁当があります:bento:", ENV['IDOBATA_DEVELOPER_HOOK_URL'])
    else
      Idobata.post("本日(#{I18n.l(order.date)})分の注文は成立しませんでした:cry:今日のランチは外に食べに行きましょう:fork_and_knife:", ENV['IDOBATA_USER_HOOK_URL'])
    end

    redirect_to todays_order_admin_orders_path, notice: '予約を締め切りました'
  end
end
