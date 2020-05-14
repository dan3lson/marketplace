# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  it { is_expected.to have_many(:assignments) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
  subject { create(:role) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
