class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
    @events = @user.created_events
  end
end
