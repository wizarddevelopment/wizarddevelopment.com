require 'rails_helper'

describe Developer do
  let(:developer) { build(:developer) }

  it "has validations" do
    expect(developer).to validate_presence_of(:name)
    expect(developer).to validate_presence_of(:bio)
  end
end
