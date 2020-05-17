# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Registration do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe '#register' do
    let!(:customer_role) { create(:role) }
    let!(:vendor_manager_role) { create(:role, :vendor_manager) }

    context 'when a blank name is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, first_name: '')).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a nil name is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, last_name: nil)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a blank email is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, email: '')).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a nil email is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, email: nil)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a blank password is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, password: '')).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a nil password is provided' do
      it 'prevents sign-up' do
        Registration.new(attributes_for(:registration, password: nil)).register

        expect(User.count).to eq(0)
      end
    end

    context 'when a guest successfully registers as a customer' do
      it 'creates :customer records and associations' do
        attrs = attributes_for(:registration)

        user = Registration.new(attrs).register

        expect(Customer.count).to eq(1)
        expect(user.roles.pluck(:name)).to include('customer')
      end
    end

    context 'when a guest successfully registers as a vendor' do
      it 'creates :vendor_manager records and associations' do
        attrs = attributes_for(:registration, :vendor_manager)

        user = Registration.new(attrs).register

        expect(VendorManager.count).to eq(1)
        expect(user.roles.pluck(:name)).to include('vendor_manager')
      end
    end
  end
end
