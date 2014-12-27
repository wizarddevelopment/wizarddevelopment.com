class CreateFreshbooksInvoice < ActiveRecord::Migration
  def change
    create_table :freshbooks_invoices do |t|
      t.string :invoice_id, null: false
      t.string :number, null: false
      t.string :organization, null: false
      t.string :client_id, null: false
      t.string :status, null: false
      t.decimal :amount, null: false
      t.decimal :amount_outstanding, null: false
      t.decimal :paid, null: false
      t.string :public_url, null: false
      t.date :date, null: false
      t.timestamps null: false
    end
    add_index :freshbooks_invoices, :invoice_id, unique: true
  end
end
