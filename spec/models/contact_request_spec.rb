require 'spec_helper'

describe ContactRequest do
  let(:request) { ContactRequest.new }
  describe "validations" do

    it "requires fields" do
      expect(request).to validate_presence_of :email
      expect(request).to validate_presence_of :name
      expect(request).to validate_presence_of :message
    end

  end

  describe ".send_mail_notification_email" do
    it "sends the contact request info in an email" do
      expect(ContactMailer).to receive(:contact_request)
      request = ContactRequest.create(name: "Armando", email: "a@wiz.com", phone: "123-123-1234", message: "HELP!")
      ContactRequest.send_notification_email(request.id)
    end
  end
end
