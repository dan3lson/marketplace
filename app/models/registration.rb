# frozen_string_literal: true

# Registration signs up a user to the platform.
class Registration
  include ActiveModel::Model

  attr_accessor :email, :password, :roles

  validates :email, presence: true
  validate  :unique_email?
  validates :password, presence: true
  validate :present_roles?

  def register
    user = build_user
    return self unless valid?

    ActiveRecord::Base.transaction do
      user.save!
      assign_roles!(user)
    end

    user
  end

  def roles=(roles)
    @roles = roles.map { |name| Role.find_by(name: name) }
  end

  private

  def unique_email?
    return unless User.exists?(email: email)

    errors.add(:email, 'has already been taken')
  end

  def present_roles?
    blank_roles = roles&.any? { |role| role.blank? }
    return unless blank_roles

    errors.add(:roles, 'must exist and be valid')
  end

  def build_user
    User.new(email: email, password: password)
  end

  def assign_roles!(user)
    roles.each do |role|
      user.assignments.create!(role: role)
    end
  end
end
