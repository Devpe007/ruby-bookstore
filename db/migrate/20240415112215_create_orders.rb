class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :person, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
