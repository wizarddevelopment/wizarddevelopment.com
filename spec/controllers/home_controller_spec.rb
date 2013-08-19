require 'spec_helper'

describe HomeController do

  it "has an index" do
    get :index
    response.should be_success
  end

end
