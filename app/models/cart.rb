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
end
