require 'rails_helper'

RSpec.describe 'User API', type: :request do
  # Initialize test data
  let(:user) { build(:user) }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password, name: user.name)
  end
  let(:user_params) { { user: valid_attributes } }
  let(:user_params_fail) { { user: { name: '', password: '', email: '' } } }

  # User signup test suite
  describe 'POST /api/v1/users/signup' do
    context 'When valid request' do
      before { post '/api/v1/users/signup', params: user_params }

      it 'Return status code 201 for user create' do
        expect(response).to have_http_status(201)
      end

      it 'Return data from success user create' do
        expect(response_body_to_json['name']).to eq(user.name)
        expect(response_body_to_json['email']).to eq(user.email)
      end
    end
    context 'When invalid request' do
      before { post '/api/v1/users/signup', params: user_params_fail }

      it 'Return status code 422 for unprocessable entity in user create' do
        expect(response).to have_http_status(422)
      end

      it 'Return failure message, params can\'t be blank for user create' do
        expect(response_body_to_json['name'][0]).to match(/can't be blank/)
        expect(response_body_to_json['email'][0]).to match(/can't be blank/)
        expect(response_body_to_json['password'][0]).to match(/can't be blank/)
      end
    end
  end
end
