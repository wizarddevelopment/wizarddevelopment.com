require 'spec_helper'

describe HomeController do

  it "has an index" do
    get :index
    expect(response).to be_success
  end

end
