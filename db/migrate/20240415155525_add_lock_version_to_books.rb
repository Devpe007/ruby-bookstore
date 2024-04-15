class AddLockVersionToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :lock_version, :integer, default: 0
  end
end
