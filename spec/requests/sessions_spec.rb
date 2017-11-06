require 'rails_helper'

RSpec.describe 'Session API', :request do
  let(:user) { User.create!(name: 'text', email: 'test@test.com', password: 'password') }
  subject(:valid_session_params) { { email: user.email, password: user.password } }
  subject(:invalid_session_params) { { email: user.email, password: '' } }

  describe 'POST /api/v1/sessions/' do
    context 'When valid request' do
      before { post '/api/v1/sessions', params: invalid_session_params }

      it 'Return status code 201 for session create' do
        expect(response).to have_http_status(200)
      end

      it 'Return token key from success session create' do
        expect(response_body_to_json.keys[0]).to eq('token')
        expect(response_body_to_json['token']).not_to be_empty
      end
    end

    context 'When invalid request' do
      before { post '/api/v1/sessions', params: {} }
      it 'return status code 400 for session create' do
        expect(response).to have_http_status(200)
      end

      it 'Return error message for wrong user/passwod on session create' do
        expect(response_body_to_json['errors'][0]['detail']).to eq('Error with you email or password')
      end
    end
  end
end
