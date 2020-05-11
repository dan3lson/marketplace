# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST #create' do
    let(:valid_email) { 'sha@nene.com'}
    let(:valid_password) { 'password'}

    context 'when a guest signs up with a blank password' do
      it 'prevents the account creation' do
        params = { email: valid_email, password: '' }

        post api_v1_sign_up_path, params: params

        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when a guest signs up without a password' do
      it 'prevents the account creation' do
        params = { email: valid_email, password: nil }

        post api_v1_sign_up_path, params: params

        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when a guest signs up with a blank email' do
      it 'prevents the account creation' do
        params = { email: '', password: valid_password }

        post api_v1_sign_up_path, params: params

        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when a guest signs up without email' do
      it 'prevents the account creation' do
        params = { email: nil, password: valid_password }

        post api_v1_sign_up_path, params: params

        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when a guest signs up with a valid email and password' do
      it 'prevents the account creation' do
        params = { email: valid_email, password: valid_password }

        post api_v1_sign_up_path, params: params

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
