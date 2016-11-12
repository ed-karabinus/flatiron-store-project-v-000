class LineItemsController < ApplicationController
  def create
    unless current_user.current_cart
      current_user.current_cart = current_user.carts.build
    end
    current_user.current_cart << LineItem.create(item_id: item_id)
    current_user.current_cart.save
  end
end
