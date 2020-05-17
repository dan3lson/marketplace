# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:vendor) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
