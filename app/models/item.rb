class Item < ActiveRecord::Base
  belongs_to :category

  has_many :line_items

  def self.available_items
    where('quantity > 0')
  end
end
