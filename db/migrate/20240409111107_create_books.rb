class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, limit: 100, null: false
      t.date :published_at, null: false
      t.text :text, null: false
      t.decimal :value, precision: 10, scale: 2, null: false
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
