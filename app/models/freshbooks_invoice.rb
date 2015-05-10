class FreshbooksInvoice < ActiveRecord::Base
  validates :invoice_id, presence: true, uniqueness: true
  validates :number, presence: true
  validates :organization, presence: true
  validates :client_id, presence: true
  validates :status, presence: true
  validates :amount, presence: true
  validates :amount_outstanding, presence: true
  validates :paid, presence: true
  validates :date, presence: true
  validates :public_url, presence: true

  FIELDS_TO_IMPORT = %w(
    invoice_id
    number
    organization
    client_id
    status
    amount
    paid
    date
    amount_outstanding
  )

  def self.import(invoice)
    attributes = invoice.slice(*FIELDS_TO_IMPORT)
    attributes["public_url"] = invoice["links"]["client_view"]
    where(attributes.slice("invoice_id"))
      .first_or_initialize
      .tap { |record| record.update!(attributes) }
  end
end
