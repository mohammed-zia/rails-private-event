class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Your event has been created."
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def ticket
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are already on the list."
    else
      @event.attendees << current_user
      redirect_to @event, notice: "You've been added to the list!"
    end
  end

  def delete_ticket
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event."
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end

end
