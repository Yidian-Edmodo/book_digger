module Authenticable
  def current_user
    @current_user ||= User.find_by auth_token: request.headers['Authentication']
  end

  def authenticate_with_token!
    render_401 'Not authenticated' unless current_user.present?
  end
end
