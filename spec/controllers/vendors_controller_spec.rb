require 'spec_helper'

describe Api::V1::VendorsController do
  include Rails.application.routes.url_helpers
  include Devise::TestHelpers

  context "unauthenticated" do
    context "GET #index" do
      it "does not render the index template" do
        get :index
        flash[:alert].should == "Please sign in or sign up before continuing."
      end
    end
    context "GET #show" do
      it "does not render the index template" do
        get :show
        flash[:alert].should == "Please sign in or sign up before continuing."
      end
    end
  end

  context "authenticated" do
    let!(:user) { FactoryGirl.create :user }
    let!(:vendor) { FactoryGirl.create :vendor }

    before(:each) do
      sign_in(user)
    end
    context "GET #index" do
      it "populates and array of vendors" do
        get :index, :format => :json
        expect(JSON.parse(response.body).first).to eq JSON.parse(vendor.to_json)
      end
    end
    context "GET #show" do
      it "assigns the requested vendor to vendor" do
        xhr :get, :show, :id => vendor, :format => :json
        #get :show, id: vendor, :format => :json
        expect(assigns(:vendor)).to eq vendor
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
end