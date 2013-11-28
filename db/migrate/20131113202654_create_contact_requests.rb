class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :business_name
      t.text :message
      t.timestamps
    end
  end
end
