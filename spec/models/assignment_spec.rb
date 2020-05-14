# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it { is_expected.to belong_to(:role) }
  it { is_expected.to belong_to(:user) }
  subject { create(:assignment) }
  it { is_expected.to validate_uniqueness_of(:user).scoped_to(:role_id) }
end
