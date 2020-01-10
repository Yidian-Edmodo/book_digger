class Api::LoginController < ApplicationController
  include RenderJSON

  protect_from_forgery unless: -> { request.format.json? }

  def create
    user = User.find_by(email: params[:email])
    if user.try(:valid_password?, params[:password])
      render_200 auth_token: user.auth_token
    else
      render_401
    end
  end
end
