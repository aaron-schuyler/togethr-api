class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def current_user
    User.find(JsonWebToken.decode(cookies.signed[:jwt])[:user_id])
  end
end
