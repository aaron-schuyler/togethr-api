class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
  def show
    user = User.find(params[:id])
    render json: user
  end
  def create
    user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      user.save
    else
      render json: {success: false, messages: user.errors.full_messages}
    end
  end
  def update

  end
  def destroy

  end
end
