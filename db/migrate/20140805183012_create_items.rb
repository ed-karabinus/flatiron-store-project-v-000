class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.decimal :price
      t.integer :quantity
      t.belongs_to :category
    end
  end
end
