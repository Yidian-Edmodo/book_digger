class ApplicationController < ActionController::Base
  include RenderJson
  protect_from_forgery unless: -> { request.format.json? }
end
