# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  it { is_expected.to have_many(:addresses) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:iso) }
  it { is_expected.to validate_presence_of(:iso3) }
  it { is_expected.to validate_length_of(:iso).is_equal_to(2) }
  it { is_expected.to validate_length_of(:iso3).is_equal_to(3) }
  subject { create(:country) }
  it { is_expected.to validate_uniqueness_of(:iso) }
  it { is_expected.to validate_uniqueness_of(:iso3) }
end
