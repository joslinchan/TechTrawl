class EventsController < ApplicationController

  def index
    event_api = EventRetriever.new.events

    event_api['events'].each do |event|
      @event = Event.new(
        meetup_id: event["id"],
        name: event["name"],
        start_time: event["local_date"],
        end_time: event["local_date"],
        company_id: Company.all.sample.id,
        urlname: event["group"]["urlname"],
        link: event["link"]
     )

    if @event.save
    end

    @events = Event.order(start_time: :asc)

    end

  end

end
