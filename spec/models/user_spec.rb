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
end
