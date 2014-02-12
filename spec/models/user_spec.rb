require 'spec_helper'

describe User do
  context '#attributes' do
      it { should respond_to :email }
      it { should respond_to :authentication_token }
  end

  context '#associations' do
    it {should have_many(:vendors).through(:pre_qualifications)}
  end
end