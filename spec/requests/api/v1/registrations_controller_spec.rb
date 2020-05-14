# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
  describe 'POST #create (for a customer)' do
    let!(:role) { create(:role) }
    let(:valid_email) { 'sha@nene.com' }
    let(:valid_password) { 'password' }

    def sign_up(params)
      post api_v1_sign_up_path, params: params
    end

    def params(email:, password:, roles: [:customer])
      { registration: { email: email, password: password, roles: roles } }
    end

    context 'when the password is empty' do
      it 'prevents the account creation' do
        sign_up(params(email: valid_email, password: ''))

        expect(JSON.parse(response.body)['errors'].keys).to include('password')
      end
    end

    context 'when the password is nil' do
      it 'prevents the account creation' do
        sign_up(params(email: valid_email, password: nil))

        expect(JSON.parse(response.body)['errors'].keys).to include('password')
      end
    end

    context 'when the email is empty' do
      it 'prevents the account creation' do
        sign_up(params(email: '', password: valid_password))

        expect(JSON.parse(response.body)['errors'].keys).to include('email')
      end
    end

    context 'when the email is nil' do
      it 'prevents the account creation' do
        sign_up(params(email: nil, password: valid_password))

        expect(JSON.parse(response.body)['errors'].keys).to include('email')
      end
    end

    context 'when roles are empty' do
      it 'prevents the account creation' do
        sign_up(params(email: valid_email, password: valid_password, roles: []))

        expect(JSON.parse(response.body)['errors'].keys).to include('roles')
      end
    end

    context 'when roles include a nonexistant role' do
      it 'prevents the account creation' do
        sign_up(params(email: valid_email, password: valid_password, roles: ['foo']))

        expect(JSON.parse(response.body)['errors'].keys).to include('roles')
      end
    end

    context 'when the email and password are valid' do
      it 'creates an account' do
        sign_up(params(email: valid_email, password: valid_password))

        expect(response).to be_ok
      end
    end
  end
end
