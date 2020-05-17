# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to have_many(:vendors) }
  end

  context 'associations' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:province) }
    it { is_expected.to validate_presence_of(:postal_code) }
  end
end
