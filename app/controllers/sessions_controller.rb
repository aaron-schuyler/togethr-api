class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value: token, httponly: true, samesite: 'None'}
      render json: {success: true}
    else
      render json: {success: false, error: "Invalid username or password"}
    end
  end
  def check_session
    begin
      user = current_user
    rescue
      render json: {success: false}
    end
    render json: {success: true} if !!user
  end
  def destroy
    cookies.delete :jwt
  end
end
