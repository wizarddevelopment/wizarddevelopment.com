require "spec_helper"

describe ContactMailer do
  describe "#contact_request" do
    let(:form_data) do
      ContactRequest.new(
        name: 'Francis Gulotta',
        email: 'whatever@email.org',
        message: 'do you do things?',
        business_name: "Dunkin Donuts"
      )
    end

    let(:mailer) { ContactMailer.contact_request(form_data) }

    it "sends a message to me" do
      expect(mailer.to).to eq(['francis@wizarddevelopment.com'])
    end

    it "sends a message from the requester" do
      expect(mailer.from).to eq([form_data.email])
    end

    it "sends a message if the requester didn't provide the email" do
      form_data.email = nil
      expect(mailer.from).to eq(['unknown@wizarddevelopment.com'])
    end

    it "includes form data" do
      expect(mailer.body).to match(form_data.name)
      expect(mailer.body).to match(form_data.email)
      expect(mailer.body).to match(form_data.business_name)
      expect(mailer.body).to match(form_data.message)
    end

    #
    it "delivers" do
      mailer
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end
  end
end
