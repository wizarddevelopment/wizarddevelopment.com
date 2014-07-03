class ChangeTeamEmailDatatype < ActiveRecord::Migration
  def change
    change_column :team, :email, :string
  end
end
