class CreateFreshbooksPayments < ActiveRecord::Migration
  def change
    create_table :freshbooks_payments do |t|
      t.string :payment_id, null: false
      t.string :invoice_id, null: false
      t.string :client_id, null: false
      t.string :payment_type, null: false
      t.string :currency_code, null: false
      t.string :gateway_reference_id
      t.string :gateway_name
      t.text :notes
      t.decimal :amount, null: false
      t.decimal :from_credit, null: false

      t.date :date, null: false
      t.date :updated, null: false
      t.timestamps null: false
    end
  end
end
