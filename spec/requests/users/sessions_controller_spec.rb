require 'rails_helper'

describe Users::SessionsController, type: :request do

  let (:user) { create(:user) }
  let (:login_url) { '/users/sign_in' }
  let (:logout_url) { '/users/sign_out' }

  context 'when logging in' do
    before do
      login_with_api(create(:user))
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'when user login with login and password and then password is empty' do
    before do
      post login_url, params: {
        user: {
          email: user.email
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'when logging out' do
    before do
      login_with_api(create(:user))
    end
    it 'returns 204' do
      delete logout_url, headers: {
        'Authorization': response.headers['Authorization']
      }
      expect(response).to have_http_status(200)
    end
  end

end
