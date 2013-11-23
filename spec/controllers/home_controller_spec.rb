require 'spec_helper'

describe HomeController do

  it "has an index" do
    get :index
    expect(response).to be_success
  end

  it "has pushstate routes" do
    get :business
    expect(response).to be_success
    get :devteam
    expect(response).to be_success
  end

end
