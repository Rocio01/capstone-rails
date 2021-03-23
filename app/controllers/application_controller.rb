class ApplicationController < ActionController::Base
  include SessionsHelper
  # Confirms a logged-in user.
  def logged_in_user
    redirect_to login_url unless logged_in?
  end

  #  Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
