class GroupsController < ApplicationController
    
    before_action :logged_in_user, only: [:index,  :create, :destroy]
 
    def new
       @group = Group.new
    end
    
    def index
        @groups = Group.all
    end
    

    def create

    end


    def destroy

    end

  private
  


end
