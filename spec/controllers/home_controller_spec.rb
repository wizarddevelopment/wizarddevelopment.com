require 'spec_helper'

describe HomeController do

  it "has an index" do
    get :index
    response.should be_success
  end

  describe ".contact" do

    it "takes contact info" do
      info = {
        name: 'Francis Gulotta',
        email: 'whatever@email.org',
        message: 'do you do things?',
        reason: "I need things"
      }
      xhr :post, :contact, info: info
      expect(response).to be_success
    end

    it "rejects no data" do
      xhr :post, :contact
      expect(response).to_not be_success
    end

  end

end
