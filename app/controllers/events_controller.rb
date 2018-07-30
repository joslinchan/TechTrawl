class EventsController < ApplicationController

  def index
    @events = Event
      .search(params[:search])
      .order(start_time: :asc)
      .paginate(:per_page => 10, :page => params[:page])

    event_api = EventRetriever.new.events

    event_api['events'].each do |event|
      event = Event.new(
        meetup_id: event["id"],
        name: event["name"],
        start_time: event["local_date"],
        end_time: event["local_date"],
        company_id: Company.all.sample.id,
        urlname: event["group"]["urlname"],
        link: event["link"]
      )
    if event.save
    end
    end
  end

  def destroy
    @event ||= Event.find params[:id]

    @event.destroy

    redirect_to admin_dashboard_events_path
  end
end
