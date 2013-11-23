require 'spec_helper'

describe ContactRequestsController do

  describe ".create" do

    it "takes contact info" do
      info = {
        name: 'Francis Gulotta',
        email: 'whatever@email.org',
        message: 'do you do things?',
        reason: "I need things"
      }
      post :contact, info: info
      expect(response).to be_redirect
    end

    it "rejects no data" do
      post :contact
      expect(response).to_not be_success
    end

  end

end
