require 'rails_helper'

describe Users::RegistrationsController, type: :request do

  let (:signup_url) { '/users' }

  context 'Creating a user with email' do
    before do
      post signup_url, params: { "user": { "username": Faker::Name.name,
                                           "password": Faker::Internet.password,
                                            "email":  Faker::Internet.email} }
    end
    it 'returns 200, token and welcome message' do
      expect(response.status).to eq(200)
      expect(response.headers['Authorization']).to be_present
      expect(json_body["status"]["message"]).to eq "Signed up successfully."
    end
  end

  context 'Creating a user without email' do
    before do
      post signup_url, params: { "user": { "username": Faker::Name.name,
                                           "password": Faker::Internet.password
                                         } 
                                }
    end
    it 'returns 200, and throws error message' do
      expect(response.status).to eq(200)
      expect(json_body["message"]).to eq "Email can't be blank"
    end
  end

  context 'Creating a user without password' do
    before do
      post signup_url, params: { "user": { "username": Faker::Name.name,
                                           "email": Faker::Internet.email
                                         } 
                                }
    end
    it 'returns 200, and throws error message' do
      expect(response.status).to eq(200)
      expect(json_body["message"]).to eq "Password can't be blank"
    end
  end
end
