class Api::SessionController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!
end
