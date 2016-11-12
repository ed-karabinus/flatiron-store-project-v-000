class Cart < ActiveRecord::Base
  has_one :order

  has_many :line_items
  has_many :items, through: :line_items

  belongs_to :user

  def total
    return line_items.inject(0) do |sum, line_item|
      sum + (line_item.quantity * line_item.item.price)
    end
  end

  def add_item(item_id)
    line_item = LineItem.find_by(cart_id: id, item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = LineItem.new(cart_id: id, item_id: item_id, quantity: 1)
    end
    return line_item
  end
end
