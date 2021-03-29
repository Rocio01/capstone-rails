class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]
  before_action :correct_activity, only: :destroy

  def new
    @activity = Activity.new
    @groups = Group.all
  end

  def index
    @activities = current_user.activities.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = current_user.activities.build(activity_params)
    @activity.groups = Group.find(params[:activity][:group_ids]) if params[:activity][:group_ids]
    if @activity.save
      if params[:activity][:group_ids]
        flash[:success] = 'Activity created!'
        redirect_to activitiesg_path

      else
        flash[:success] = 'External Activity created!'
        redirect_to external_path

      end
    else
      render :new
    end
  end

  def destroy
    @activity.destroy
    flash[:success] = 'Activity deleted'
    redirect_to current_user
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :activity_time, :id)
  end

  def correct_activity
    @activity = current_user.activities.find_by(id: params[:id])
  end
end
