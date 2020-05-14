# frozen_string_literal: true

module Api
  module V1
    # RegistrationsController
    class RegistrationsController < ApiController
      def create
        registration = Registration.new(registration_params).register

        if registration.valid?
          payload = { user_id: registration.id }
          token = JsonWebToken.encode(payload)

          success body: { jwt: token }
        else
          bad_request registration.errors
        end
      end

      private

      def registration_params
        params.require(:registration).permit(:email, :password, roles: [])
      end
    end
  end
end
