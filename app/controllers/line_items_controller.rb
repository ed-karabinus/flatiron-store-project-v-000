class LineItemsController < ApplicationController
  def create
    unless current_user.current_cart
      current_user.current_cart = current_user.carts.build
    end
    line_item = current_user.current_cart.add_item(params[:item_id])
    line_item.save
    redirect_to cart_path(current_user.current_cart)
  end
end
