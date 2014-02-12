require 'spec_helper'

describe PreQualification do
  context '#attributes' do
      it { should respond_to :user_id }
      it { should respond_to :vendor_id }
      it { should respond_to :assigned }
      it { should respond_to :start_time }
      it { should respond_to :end_time }
  end
  context '#associations' do
    it {should belong_to(:vendor)}
    it {should belong_to(:user)}
  end
end