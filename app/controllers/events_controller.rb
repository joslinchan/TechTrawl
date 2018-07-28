class EventsController < ApplicationController

  def index
    @events = EventRetriever.new.events
    render json: @events
  end

end
