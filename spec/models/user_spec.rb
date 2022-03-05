require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user, email:'dev@example.com') }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password).of_type(:string) }
    it { should have_db_column(:confirm_password).of_type(:string) }
  end

  describe 'create' do
    it { expect { user.save }.to change(User, :count).by(1) }
  end

  describe 'Validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:confirm_password) }
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it 'should not take invalid emails' do
      expect(user).to_not allow_value('something').for(:email)
      expect(user.errors.full_messages.to_sentence).to eq('Email is invalid')
      expect(user.errors.count).to eq(1)
    end
  end

  describe 'validation tests using static' do
    it 'check password and confirpassword are same' do
      expect(user.password).to eq(user.confirm_password)
    end
  end
end
