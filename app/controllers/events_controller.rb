class EventsController < ApplicationController

  def index
    @events = EventRetriever.new.events
    @test = @events["events"].map { |k, v| k['name'] }
    # @test = @events["events"].map { |(key, val)| key == 'name' }

    #render json: @events
    #@events = Event.order(created_at: :desc)
  end

  def create
    @event = EventRetriever.new.events event_params
    @event.save
    redirect_to :index
  end

  private
  def event_params
    params.require(:event).permit(:name, :local_date)
  end

end
