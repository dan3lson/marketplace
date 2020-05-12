# frozen_string_literal: true

module Api
  module V1
    # SessionsController
    class SessionsController < ApiController
      def create
        user = User.find_by(email: session_params[:email]&.downcase)
        valid_credentials = user&.authenticate(session_params[:password])
        return unauthorized unless valid_credentials

        payload = { user_id: user.id }
        token = JsonWebToken.encode(payload)

        success body: { jwt: token }
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end
