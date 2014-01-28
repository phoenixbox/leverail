require 'spec_helper'

describe Api::V1::VendorsController do
  include Devise::TestHelpers

  context "GET #index" do
    context "unauthenticated" do
      it "does not render the index template" do
        get :index
        flash[:alert].should == "Please sign in or sign up before continuing."
      end
    end
    context "authenticated" do
      before(:each) do
        @valid_user = FactoryGirl.create(:user)
        @valid_vendor = FactoryGirl.create(:vendor)
        sign_in(@valid_user)
      end
      it "renders the index template" do
        get :index, :format => :json
        expect(JSON.parse(response.body).first).should == JSON.parse(@valid_vendor.to_json)
      end
    end
  end

  context "POST #create" do
    context "with valid params" do
      #expect {
      #  post :new
      #}
    end
  end

end