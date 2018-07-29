class EventRetriever
  include HTTParty
  base_uri "api.meetup.com"
  
  def get_data
    self.class.get("/find/upcoming_events?photo-host=public&page=20&sig_id=255484866&sig=77503158690af7d982d3ec996ef2e6fe0c66662a")
  end

=begin
  def create_data
    event = Event.create()
  end

  def run
  end
=end
def create_events
  events = EventRetriever.new.events
  events["events"].each do |key, value|
    Event.create(
      name: key['name'],
      start_time: key['local_date'],
      end_time: key['local_date'],
      company: Company.sample
    )
  end
end

=begin run
  -fetch
  -store

  -retrieve for all meetup groups (fetch)
  -parse info for saving (only name and date)
=end

  def events
    get_data.parsed_response
  end
end
  