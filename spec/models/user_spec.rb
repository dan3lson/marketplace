# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_one(:customer).dependent(:destroy) }
    it { is_expected.to have_one(:vendor_manager).dependent(:destroy) }
    it { is_expected.to have_many(:assignments).dependent(:destroy) }
    it { is_expected.to have_many(:roles) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#role?' do
    context 'when assigned a :customer role' do
      it 'confirms one role' do
        user = create(:customer).user

        expect(user).to be_role(:customer)
      end
    end

    context 'when assigned a :customer and :vip role' do
      it 'confirms multiple roles' do
        user = create(:customer).user
        create(:assignment, user: user, role: create(:role, name: 'vip'))

        expect(user).to be_role(:customer)
      end
    end

    context 'when assigned a :guest role' do
      it 'confirms no user is authenticated' do
        user = build(:user)

        expect(user).to be_role(:guest)
      end
    end
  end
end
