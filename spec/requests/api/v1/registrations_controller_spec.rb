# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
  describe 'POST #create (for a customer)' do
    let!(:role) { create(:role) }
    let(:valid_email) { 'sha@nene.com' }
    let(:valid_password) { 'password' }

    context 'when the password is empty' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, password: '') }
        expect(JSON.parse(response.body)['errors'].keys).to include('password')
      end
    end

    context 'when the password is nil' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, password: nil) }

        expect(JSON.parse(response.body)['errors'].keys).to include('password')
      end
    end

    context 'when the email is empty' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, email: '') }

        expect(JSON.parse(response.body)['errors'].keys).to include('email')
      end
    end

    context 'when the email is nil' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, email: nil) }

        expect(JSON.parse(response.body)['errors'].keys).to include('email')
      end
    end

    context 'when user_type is empty' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, user_type: '') }

        expect(JSON.parse(response.body)['errors'].keys).to include('user_type')
      end
    end

    context 'when user_type does not exist' do
      it 'prevents the account creation' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration, user_type: 'foobar') }

        expect(JSON.parse(response.body)['errors'].keys).to include('user_type')
      end
    end

    context 'when form submission is successful' do
      it 'creates an account' do
        post api_v1_sign_up_path, params: { registration: attributes_for(:registration) }

        expect(response).to be_ok
      end
    end
  end
end
