class AddContactFields < ActiveRecord::Migration
  def change
    add_column :contact_requests, :dev_team, :string
    add_column :contact_requests, :product_status, :string
  end
end
