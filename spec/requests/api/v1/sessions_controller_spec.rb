# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :request do
  describe 'POST #create' do
    context 'when a user logs in with a blank password' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: user.email, password: '' }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when a user logs in with an incorrect password' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: user.email, password: 'password123' }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when a user logs in with an incorrect email' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: "1#{user.email}", password: user.password }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when a user logs in with a blank email' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: '', password: user.password }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when a user logs in without an email' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: nil, password: user.password }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when a user logs in with their correct email and password' do
      it 'responds with an unauthorized code' do
        user = create(:user)
        params = { email: user.email, password: user.password }

        post api_v1_sign_in_path, params: params

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
