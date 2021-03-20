class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to Time trac"
      redirect_to @user
    else 
      render "new"
    end

  end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
     flash[:success] = "Profile updated"
      redirect_to @user
  else
     render "edit"
  end
end

def index
  @users = User.all 
end 

def external_activities
  user = User.find_by(id: current_user.id)
  @external_activities = user.activities.where(group_id: nil)
end

def group_activities
  user = User.find_by(id: current_user.id)
  @group_activities =  user.activities.where.not(group_id: nil)
end


private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
