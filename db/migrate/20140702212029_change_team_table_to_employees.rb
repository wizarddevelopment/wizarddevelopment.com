class ChangeTeamTableToEmployees < ActiveRecord::Migration
  def change
    rename_table :team, :employees
    add_column :employees, :twitter, :string
    change_column :employees, :github, :string
    change_column :employees, :blog, :string

  end
end
