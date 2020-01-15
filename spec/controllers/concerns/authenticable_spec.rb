require 'rails_helper'

class Authentication < ApplicationController
  include Authenticable
end

RSpec.describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe '#current_user' do
    before :each do
      @user = create :user
      request.headers['Authentication'] = @user.auth_token
      allow(authentication).to receive(:request).and_return(request)
    end

    it 'returns the user form auhtorization header' do
      expect(authentication.current_user.auth_token).to eq @user.auth_token
      authentication
    end
  end

  describe '#authenticate_with_token' do
    before :each do
      @user = create :user
      allow(authentication).to receive(:current_user).and_return(nil)
      allow(response).to receive(:response_code).and_return(401)
      allow(response).to receive(:body).and_return({ 'errors' => 'Not authenticated' }.to_json)
      allow(authentication).to receive(:response).and_return(response)
    end

    it { should respond_with 401 }

    it 'render a json error message' do
      expect(json_response[:errors]).to eq 'Not authenticated'
    end
  end
end
