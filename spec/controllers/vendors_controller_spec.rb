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
      let!(:user) { FactoryGirl.create :user }
      let!(:vendor) { FactoryGirl.create :vendor }

      before(:each) do
        sign_in(user)
      end
      it "renders the index template" do
        get :index, :format => :json
        expect(JSON.parse(response.body).first).should == JSON.parse(vendor.to_json)
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