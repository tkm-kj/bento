require 'rails_helper'

RSpec.feature "Order::OrderItems", type: :feature do

  feature '注文の確認' do
    scenario '注文者は自分の注文を確認できる' do
      lunchbox = create(:lunchbox)
      order = create(:order)
      order_item = create(:order_item, order: order, lunchbox: lunchbox)

      visit order_order_items_path(order)
      expect(page).to have_text(order_item.customer_name)
    end
  end

  feature '注文の新規作成' do
    scenario 'Order が締め切られている場合、注文者は新しく注文できない' do
      lunchbox = create(:lunchbox)
      order = create(:order, closed_at: Time.zone.local(2017, 2, 1))

      visit order_order_items_path(order)

      click_link('予約する')
      # インデックスに戻される
      expect(page).to have_text('予約する')

    end
  end

  feature '注文のキャンセル' do
    scenario '注文者は自分の注文をキャンセルできる' do
      lunchbox = create(:lunchbox)
      order = create(:order)
      order_item = create(:order_item, order: order, lunchbox: lunchbox)

      visit order_order_items_path(order)
      expect(page).to have_text(order_item.customer_name)
      expect(page).to have_text("cancel")

      click_link('cancel')
      expect(page).not_to have_text(order_item.customer_name)

    end

    scenario 'Order が締め切られている場合、注文者は自分の注文をキャンセルできない' do
      lunchbox = create(:lunchbox)
      order = create(:order, closed_at: Time.zone.local(2017, 2, 1))
      order_item = create(:order_item, order: order, lunchbox: lunchbox)

      visit order_order_items_path(order)
      expect(page).to have_text(order_item.customer_name)

      click_link('cancel')
      expect(page).to have_text(order_item.customer_name)

    end
  end



end


