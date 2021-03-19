class GroupsController < ApplicationController
    
    before_action :logged_in_user, only: [:index,  :create, :destroy]
 
    def new
       @group = Group.new
    end
    
    def index
        @groups = Group.all
    end
    

    def create
      @group = current_user.groups.build(group_params)
      if @group.save
        flash[:success] = "Group created!"
        redirect_to root_url
      else 
        render :new
      end

    end


    def destroy

    end

    def show
     @group = Group.find(params[:id])
    end

  private



     def group_params
        params.require(:group).permit(:name, :icon)
     end
  


end
