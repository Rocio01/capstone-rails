class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]
  before_action :correct_activity, only: :destroy

  def new
    @activity = Activity.new
  end

  def show; end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      if @activity.group_id.nil?
        flash[:success] = 'External Activity created!'
        redirect_to external_path
      else
        flash[:success] = 'Activity created!'
        redirect_to activitiesg_path
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
    params.require(:activity).permit(:name, :activity_time, :group_id, :id)
  end

  def correct_activity
    @activity = current_user.activities.find_by(id: params[:id])
  end
end
