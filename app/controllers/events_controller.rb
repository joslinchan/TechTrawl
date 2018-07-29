class EventsController < ApplicationController

  def index
    @events = EventRetriever.new.events
  end

=begin   
def create
    @event = EventRetriever.new.events event_params
    @event.save
    redirect_to :index
  end

  private
  def event_params
    params.require(:event).permit(:name, :local_date)
  end 
=end


end
