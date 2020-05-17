# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:vendor_manager) }
    it { is_expected.to belong_to(:address) }
    it { is_expected.to have_many(:products).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:vendor) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
