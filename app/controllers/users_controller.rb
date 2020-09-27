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
    user = User.new(user_params)
    if user.valid?
      user.save
    else
      render json: {success: false, messages: user.errors.full_messages}
    end
  end
  def update

  end
  def add_skills
    user = current_user
    params[:skills].each do |skill|
      skill = Skill.find_or_create_by(name: skill[:name], subcategory_id: skill[:subcategory_id])
      user.skills << skill
    end
    render json: {success: true, skills: user.skills}, status: 200
  end
  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :skills)
  end
end
