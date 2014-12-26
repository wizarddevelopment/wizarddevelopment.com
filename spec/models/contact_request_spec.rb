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
end
