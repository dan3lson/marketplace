# frozen_string_literal: true

module Api
  module V1
    # UsersController
    class UsersController < ApiController
      def create
        user = User.create!(user_params)
        payload = { user_id: user.id }
        token = JsonWebToken.encode(payload)

        success body: { jwt: token }
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
