class LineItemsController < ApplicationController
  def create
    unless current_user.current_cart
      current_user.current_cart = current_user.carts.build
    end
    unless current_user.current_cart.items.include?(Item.find_by(id: params[:item_id]))
      line_item = LineItem.create(item_id: params[:item_id])
      current_user.current_cart.line_items << line_item
      current_user.current_cart.save
      item = Item.find_by(id: params[:item_id])
      item.line_items << line_item
      item.save
    else
      current_user.current_cart.line_items.find(item_id: params[:item_id]).quantity += 1
      current_user.current_cart.line_items.find(item_id: params[:item_id]).save
    end
    redirect_to cart_path(current_user.current_cart)
  end
end
