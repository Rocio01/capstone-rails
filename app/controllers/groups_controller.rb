class GroupsController < ApplicationController
  before_action :logged_in_user, only: %i[index create destroy show new]
  before_action :correct_group, only: :destroy

  def new
    @group = Group.new
    @activities = Activity.all
  end

  def index
    @groups = Group.all
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group created!'
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    flash[:success] = 'Group deleted'
    redirect_to groups_url
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def correct_group
    @group = current_user.groups.find_by(id: params[:id])
  end
end
