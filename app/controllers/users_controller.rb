class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update external_activities group_activities]
  before_action :correct_user, only: %i[edit update]

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
      flash[:success] = 'Welcome to Time trac'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def external_activities
    user = User.find_by(id: current_user.id)
    @external_activities = user.activities.includes(:activities_groups).where(activities_groups: { group_id: nil })
    @external_total = @external_activities.sum(:activity_time)
  end

  def group_activities
    user = User.find_by(id: current_user.id)
    @external_activities = user.activities.includes(:activities_groups).where(activities_groups: { group_id: nil })
    @group_activities = user.activities.includes(:activities_groups).where.not(activities_groups: { group_id: nil })

    @activities_total = user.activities.all.sum(:activity_time) - @external_activities.sum(:activity_time)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
