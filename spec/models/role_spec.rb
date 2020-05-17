# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:assignments).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:users) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:role) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
