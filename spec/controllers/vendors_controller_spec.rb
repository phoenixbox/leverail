require 'spec_helper'

describe VendorsController do
  include Devise::TestHelpers
  context "POST #create" do
    context "with valid params" do
      expect {
        post :new
      }
    end
  end
end