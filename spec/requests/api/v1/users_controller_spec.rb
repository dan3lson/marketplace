# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST #create' do
    let(:valid_email) { 'sha@nene.com' }
    let(:valid_password) { 'password' }

    def sign_up(params)
      post api_v1_sign_up_path, params: params
    end

    context 'when a guest signs up with a blank password' do
      it 'prevents the account creation' do
        params = { user: { email: valid_email, password: '' } }

        sign_up(params)

        expect(response).to be_bad_request
      end
    end

    context 'when a guest signs up without a password' do
      it 'prevents the account creation' do
        params = { user: { email: valid_email, password: nil } }

        sign_up(params)

        expect(response).to be_bad_request
      end
    end

    context 'when a guest signs up with a blank email' do
      it 'prevents the account creation' do
        params = { user: { email: '', password: valid_password } }

        sign_up(params)

        expect(response).to be_bad_request
      end
    end

    context 'when a guest signs up without email' do
      it 'prevents the account creation' do
        params = { user: { email: nil, password: valid_password } }

        sign_up(params)

        expect(response).to be_bad_request
      end
    end

    context 'when a guest signs up with a valid email and password' do
      it 'creates an account' do
        params = { user: { email: valid_email, password: valid_password } }

        sign_up(params)

        expect(response).to be_ok
      end
    end
  end
end
