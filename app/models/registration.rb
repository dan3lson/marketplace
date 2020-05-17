# frozen_string_literal: true

# Registration signs up a user to the platform.
class Registration
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :password, :user_type

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validate  :unique_email?
  validates :password, presence: true
  validates :user_type, inclusion: { in: %w[customer vendor_manager] }

  def register
    user = build_user
    return self unless valid?

    ActiveRecord::Base.transaction do
      user.save!
      create_user_type!(user)
      assign_role!(user)
    end

    user
  end


  private

  def unique_email?
    return unless User.exists?(email: email)

    errors.add(:email, 'has already been taken')
  end

  def build_user
    User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
  end

  def role
    Role.find_by(name: user_type.downcase)
  end

  def user_type_model
    user_type.classify.constantize
  end

  def create_user_type!(user)
    user_type_model.create!(user: user)
  end

  def assign_role!(user)
    user.assignments.create!(role: role)
  end
end
