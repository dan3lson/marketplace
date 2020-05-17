# frozen_string_literal: true

module Api
  module V1
    # RegistrationsController
    class RegistrationsController < ApiController
      def create
        registration = Registration.new(registration_params)

        if registration.valid?
          user = registration.register
          payload = { user_id: user.id }
          token = JsonWebToken.encode(payload)

          success body: { jwt: token }
        else
          bad_request registration.errors
        end
      end

      private

      def registration_params
        params.
          require(:registration).
          permit(:first_name, :last_name, :email, :password, :user_type)
      end
    end
  end
end
