class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = User.find(params[:id])
    @events = @user.created_events
  end
end
