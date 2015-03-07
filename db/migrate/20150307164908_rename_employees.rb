class RenameEmployees < ActiveRecord::Migration
  def change
    rename_table :employees, :developers
    change_column :developers, :name, :string, null: false
    change_column :developers, :bio, :text, null: false
  end
end
