# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VendorManager, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:vendors).dependent(:restrict_with_error) }
  end
end
