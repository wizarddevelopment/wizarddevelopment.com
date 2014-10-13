class AddBlogImageToBlogEntry < ActiveRecord::Migration
  def self.up
    add_attachment :blog_entries, :blog_image
    remove_column :blog_entries, :image_url
  end

  def self.down
    remove_attachment :blog_entries, :blog_image
    add_column :blog_entries, :image_url
  end
end
