require 'rails_helper'

describe FreshbooksInvoice do
  let(:invoice) do
    {
      "invoice_id" => "00001395828",
      "number" => "01052",
      "client_id" => "45165",
      "recurring_id" => nil,
      "organization" => "Bien Cuit",
      "first_name" => "Kate",
      "last_name" => "Wheatcroft",
      "p_street1" => "120 Smith Street",
      "p_street2" => nil,
      "p_city" => "Brooklyn",
      "p_state" => "New York",
      "p_country" => "United States",
      "p_code" => "11201",
      "po_number" => nil,
      "status" => "paid",
      "amount" => "8600.00",
      "amount_outstanding" => "0.00",
      "paid" => "8600.00",
      "date" => "2014-12-22 00:00:00",
      "notes" => "Development for weeks of 12/8/14 and 12/15/14.",
      "terms" => "Please pay Net 15 with check, credit card, or wire transfer.",
      "discount" => "0",
      "updated" => "2014-12-26 19:01:14",
      "currency_code" => "USD",
      "language" => "en",
      "staff_id" => "1",
      "links" => {
        "client_view" => "https://wizarddevelopment.freshbooks.com/view/3MDV6rMkfDL3ytqZ",
        "view" => "https://wizarddevelopment.freshbooks.com/invoices/1395828",
        "edit" => "https://wizarddevelopment.freshbooks.com/invoices/1395828/edit"
      }
    }
  end

  describe "#import" do
    it "creates new invoices" do
      freshbook_invoice = FreshbooksInvoice.import(invoice)
      expect(freshbook_invoice).to be_valid
      expect(freshbook_invoice).to be_persisted
    end

    it "updates existing invoices" do
      origional_invoice = create(:freshbooks_invoice, invoice_id: invoice["invoice_id"], status: "viewed")
      import = FreshbooksInvoice.import(invoice)
      expect(origional_invoice).to eq(import)
      origional_invoice.reload
      expect(origional_invoice.status).to eq("paid")
    end
  end
end
