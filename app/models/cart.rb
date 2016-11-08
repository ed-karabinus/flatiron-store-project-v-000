class Cart < ActiveRecord::Base
  belongs_to :user

  has_many :line_items

  def total
    return line_items.inject(0) do |sum, line_item|
      sum + (line_item.quantity * line_item.item.price)
    end
  end
end
