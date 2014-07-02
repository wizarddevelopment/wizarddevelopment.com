class AddTeamTable < ActiveRecord::Migration
  def change
    create_table :team do |t|
      t.string :name
      t.text :email
      t.text :github
      t.text :blog
      t.text :bio
      t.timestamps
    end
  end
end
