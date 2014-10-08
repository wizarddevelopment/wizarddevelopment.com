class CreateBlogEntries < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.string :name
      t.text :summary
      t.string :url
      t.string :image_url
      t.datetime :published_at
      t.string :guid

      t.timestamps
    end
  end
end
