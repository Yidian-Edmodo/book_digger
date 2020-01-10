class ApplicationController < ActionController::Base
  include RenderJSON

  protect_from_forgery unless: -> { request.format.json? }
end
