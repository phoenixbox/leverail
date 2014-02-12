require 'spec_helper'

describe Vendor do
  context '#attributes' do
      it { should respond_to :title }
      it { should respond_to :description }
      it { should respond_to :summary }
      it { should respond_to :vendor_type }
      it { should respond_to :thumbnail }
      it { should respond_to :phone_number }
      it { should respond_to :website_url }
      it { should respond_to :address }
      it { should respond_to :city }
      it { should respond_to :state }
      it { should respond_to :zip_code }
  end

  context '#validations' do
    it {should validate_presence_of(:title)}
    it {should validate_uniqueness_of(:title)}

    it {should validate_presence_of(:description)}

    it {should validate_presence_of(:summary)}

    it {should validate_presence_of(:vendor_type)}

    it {should validate_presence_of(:thumbnail)}
    it {should validate_uniqueness_of(:thumbnail)}

    it {should validate_presence_of(:phone_number)}
    it {should validate_uniqueness_of(:phone_number)}

    it {should validate_presence_of(:website_url)}
    it {should validate_uniqueness_of(:website_url)}

    it {should validate_presence_of(:address)}
    it {should validate_uniqueness_of(:address)}

    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
  end

  context '#associations' do
    it {should have_many(:users).through(:pre_qualifications)}
  end
end






