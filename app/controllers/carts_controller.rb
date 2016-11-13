class CartsController < ApplicationController
  def checkout
    @cart = Cart.find_by(id: params[:id])
    @user = @cart.user
    @cart.line_items.each do |line_item|
      item = line_item.item
      item.inventory -= line_item.quantity
      item.save
    end
    @cart.status = "submitted"
    @cart.save
    @user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
