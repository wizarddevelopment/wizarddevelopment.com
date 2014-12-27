class FreshbooksPayment < ActiveRecord::Base
  validates :payment_id, presence: true, uniqueness: true
  validates :invoice_id, presence: true
  validates :date, presence: true
  validates :updated, presence: true
  validates :payment_type, presence: true
  validates :client_id, presence: true
  validates :amount, presence: true
  validates :from_credit, presence: true
  validates :currency_code, presence: true

  FIELDS_TO_IMPORT = %w(
    payment_id
    invoice_id
    client_id
    currency_code
    amount
    from_credit
    notes
    date
    updated
  )

  def self.import(payment)
    attributes = payment.slice(*FIELDS_TO_IMPORT)
    attributes["payment_type"] = payment["type"]

    gateway = payment["gateway_transaction"]
    if gateway
      attributes["gateway_reference_id"] = gateway["reference_id"]
      attributes["gateway_name"] = gateway["gateway_name"]
    end

    record = first_or_initialize(attributes.slice("payment_id"))
    record.update!(attributes)
    record
  end
end
