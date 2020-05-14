# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Registration do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe '#register' do
    let!(:role) { create(:role) }
    context 'when a blank email is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, :blank_email)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a nil email is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, :nil_email)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a blank password is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, :blank_password)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a nil password is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, :nil_password)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a role does not exist' do
      it 'prevents sign-up' do
        attrs = attributes_for(:registration, :nonexistent_role)

        expect(User.count).to eq(0)
      end
    end

    context 'when a guest successfully registers as a customer' do
      it 'assigns the new user as a customer' do
        attrs = attributes_for(:registration)

        user = Registration.new(attrs).register

        expect(user.roles.pluck(:name)).to include('customer')
      end
    end

    context 'when a guest successfully registers with multiple roles' do
      it 'creates multiple role assignments' do
        create(:role, name: 'trial_vip_customer')
        attrs = attributes_for(:registration, :multiple_roles)

        user = Registration.new(attrs).register

        expect(user.roles.pluck(:name)).to include('customer', 'trial_vip_customer')
      end
    end
  end
end
