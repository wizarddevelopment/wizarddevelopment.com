class AddPhotoColumnToTeamTable < ActiveRecord::Migration
  def change
    add_column :team, :photo, :string
  end
end
