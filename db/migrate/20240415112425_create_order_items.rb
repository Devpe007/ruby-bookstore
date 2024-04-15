class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true, index: true
      t.references :book, null: false, foreign_key: true, index: true
      t.integer :quantity, null: false
      t.decimal :value, precision: 15, scale: 2, null: false

      t.timestamps
    end
  end
end
