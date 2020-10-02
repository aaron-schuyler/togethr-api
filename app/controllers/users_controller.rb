class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
  def show
    user = current_user
    render json: {username: user.username, email: user.email, skills: user.skills.map{|skill| {name: skill.name, id: skill.id}}}
  end
  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value: token, httponly: true}
      render json: {success: true}
    else
      render json: {success: false, messages: user.errors.full_messages}
    end
  end
  def update

  end
  def add_skills
    user = current_user
    params[:skills].each do |skill|
      # skill = Skill.find_or_create_by(name: skill[:name], subcategory_id: skill[:subcategory_id])
      skill = Skill.find(skill)
      begin
        user.skills << skill
      rescue
      end
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
