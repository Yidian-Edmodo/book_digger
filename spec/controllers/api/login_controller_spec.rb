require 'rails_helper'

RSpec.describe Api::LoginController, type: :controller do
  describe 'Login #create' do
    before :each do
      @user = create(:user)
      post :create, params: { email: @user.email, password: @user.password }
    end

    it { should respond_with 200 }

    it 'returns right token' do
      expect(json_response[:data][:auth_token]).to eq @user.auth_token
    end
  end
end
