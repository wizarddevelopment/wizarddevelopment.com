require 'spec_helper'

describe ContactRequestsController do

  describe ".create" do

    it "takes contact info" do
      contact_request = {
        name: 'Francis Gulotta',
        email: 'whatever@email.org',
        message: 'do you do things?',
        reason: "I need things"
      }
      post :create, contact_request: contact_request
      expect(response).to be_redirect
    end

    it "rejects no data" do
      post :create, contact_request: {duno:4}
      expect(response).to_not be_success
    end

  end

end
