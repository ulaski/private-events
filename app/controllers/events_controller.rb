# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
