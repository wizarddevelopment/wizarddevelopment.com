require 'spec_helper'

describe ContactRequestsController do

  describe ".create" do
    let(:contact_request_data) do
      {
        name: 'Francis Gulotta',
        email: 'whatever@email.org',
        message: 'do you do things?',
        business_name: "Dunkin Donuts"
      }
    end

    it "takes contact info" do
      post :create, contact_request: contact_request_data
      expect(response).to be_redirect
      expect(flash[:notice]).to match(/thank you/i)
    end

    it "rejects no data" do
      post :create, contact_request: {duno:4}
      expect(response).to_not be_success
    end

    it "sends email" do
      expect(ContactMailer).to receive(:contact_request)
      post :create, contact_request: contact_request_data
      expect(response).to be_redirect
    end
  end

end
