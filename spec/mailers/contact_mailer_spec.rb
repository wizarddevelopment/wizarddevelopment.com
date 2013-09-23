require "spec_helper"

describe ContactMailer do

  describe "#contact_request" do
    let(:form_data) do
      {
        name: 'Francis Gulotta',
        email: "wizard@roborooter.com",
        reason: "I need some stuff",
        message: "How do you charge?"
      }
    end

    let(:mailer) { ContactMailer.contact_request(form_data) }

    it "sends a message to me" do
      expect(mailer.to).to eq(['francis@wizardcomputing.com'])
    end

    it "sends a message from the requester" do
      expect(mailer.from).to eq([form_data[:email]])
    end

    it "sends a message if the requester didn't provide the email" do
      form_data.delete(:email)
      expect(mailer.from).to eq(['unknown@wizardcomputing.com'])
    end

    it "includes form data" do
      expect(mailer.body).to match(form_data[:name])
      expect(mailer.body).to match(form_data[:email])
      expect(mailer.body).to match(form_data[:reason])
      expect(mailer.body).to match(form_data[:message])
    end

    it "delivers" do
      mailer.deliver
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end

  end

end
