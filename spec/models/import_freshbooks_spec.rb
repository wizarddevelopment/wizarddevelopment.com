require 'rails_helper'

describe ImportFreshbooks do
  let(:mock_client) { double("FreshBooks::Client", invoice: double("invoice"), payment: double("payment")) }
  let(:importer) { ImportFreshbooks.new(client: mock_client) }
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
      "status" => "viewed",
      "amount" => "8600.00",
      "amount_outstanding" => "8600.00",
      "paid" => "0.00",
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

  let(:payment) do
    {
      "payment_id" => "555084",
      "invoice_id" => "00001354033",
      "date" => "2014-12-19 00:00:00",
      "type" => "MASTERCARD",
      "notes" => "Stripe: ch_5MCG3t4L1VHqP9",
      "client_id" => "107996",
      "amount" => "4800.000",
      "updated" => "2014-12-19 11:44:58",
      "currency_code" => "USD",
      "gateway_transaction" => {
        "reference_id" => "ch_5MCG3t4L1VHqP9",
        "gateway_name" => "Stripe"
      },
      "from_credit" => "0"
    }
  end

  let(:invoice_list) do
    {
      "invoices" => {
        "invoice" => [invoice],
        "pages" => 1
      }
    }
  end

  let(:payment_list) do
    {
      "payments" => {
        "payment" => [payment],
        "pages" => 1
      }
    }
  end
  describe "init" do
    it "creates a client" do
      expect(importer.client).to_not eq(nil)
    end
  end

  describe "api methods" do
    it "gets all invoices" do
      expect(mock_client.invoice).to receive(:list).and_return(invoice_list)
      expect(importer.invoices).to eq([invoice])
    end

    it "gets all payments" do
      expect(mock_client.payment).to receive(:list).and_return(payment_list)
      expect(importer.payments).to eq([payment])
    end

    it "gets two pages of resources" do
      payment_list["payments"]["pages"] = 2
      expect(mock_client.payment).to receive(:list).twice.and_return(payment_list)
      expect(importer.payments).to eq([payment, payment])
    end
  end

  context "import methods" do
    describe "#import_invoices" do
      it "tells FreshbooksInvoice to import each item" do
        expect(mock_client.invoice).to receive(:list).and_return(invoice_list)
        expect(FreshbooksInvoice).to receive(:import).with(invoice)
        expect(importer.import_invoices.count).to eq(1)
      end
    end

    describe "#import_payments" do
      it "tells FreshbooksPayment to import each item" do
        expect(mock_client.payment).to receive(:list).and_return(payment_list)
        expect(FreshbooksPayment).to receive(:import).with(payment)
        expect(importer.import_payments.count).to eq(1)
      end
    end
  end
end
