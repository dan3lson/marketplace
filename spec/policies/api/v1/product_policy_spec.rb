# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ProductPolicy do
  subject { described_class }

  permissions :index? do
    it 'denies access if user is a vendor_manager' do
      vendor_manager = create(:vendor_manager).user

      expect(subject).not_to permit(vendor_manager)
    end

    it "grants access if user is a guest or customer" do
      guest = User.new
      customer = create(:customer).user

      expect(subject).to permit(guest, customer)
    end
  end
end
