# frozen_string_literal: true

# Ability defines authorization permissions per resource.
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role?(:customer)
      can :read, :all
    elsif user.role?(:vendor_manager)
      can :manage, Product, vendor: { vendor_manager: { user_id: user.id } }
    elsif user.role?(:guest)
      can :index, Product.for_guests
    end
  end
end
