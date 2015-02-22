require 'rails_helper'

describe FreshbooksPayment do
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
      "from_credit" => "0"
    }
  end

  let(:gateway_payment) do
    payment.merge({
      "gateway_transaction" => {
        "reference_id" => "ch_5MCG3t4L1VHqP9",
        "gateway_name" => "Stripe"
      }
    })
  end

  describe "#import" do
    it "creates new payments" do
      freshbook_payment = FreshbooksPayment.import(payment)
      expect(freshbook_payment).to be_valid
      expect(freshbook_payment).to be_persisted
    end

    it "sets gateway info" do
      freshbook_payment = FreshbooksPayment.import(gateway_payment)
      expect(freshbook_payment.gateway_reference_id).to_not be_nil
      expect(freshbook_payment.gateway_name).to_not be_nil
      expect(freshbook_payment).to be_valid
      expect(freshbook_payment).to be_persisted
    end

    it "updates existing payments" do
      freshbooks_payment = create(:freshbooks_payment, payment_id: payment["payment_id"], payment_type: "rocks")
      import_payment = FreshbooksPayment.import(payment)
      expect(freshbooks_payment).to eq(import_payment)
      freshbooks_payment.reload
      expect(freshbooks_payment.payment_type).to eq("MASTERCARD")
    end
  end
end
