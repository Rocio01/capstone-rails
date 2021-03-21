class ActivitiesController < ApplicationController

    before_action :logged_in_user, only: [:create, :destroy]


    def new
        @activity = Activity.new
    end

    def create
        @activity = current_user.activities.build(activity_params)
        if @activity.save
            if @activity.group_id.nil?
                flash[:success] = "External Activity created!"
                redirect_to external_path
            else  
                flash[:success] = "Activity created!"
                redirect_to activitiesg_path
            end
        else 
            render :new
        end

    end



    private

    def activity_params
        params.require(:activity).permit(:name, :activity_time, :group_id)
    end


end
