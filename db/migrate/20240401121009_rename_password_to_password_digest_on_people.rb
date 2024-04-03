class RenamePasswordToPasswordDigestOnPeople < ActiveRecord::Migration[7.1]
  def change
    rename_column :people, :password, :password_digest
  end
end
