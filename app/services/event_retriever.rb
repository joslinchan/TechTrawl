class EventRetriever
  include HTTParty
  base_uri "api.meetup.com"
  def initialize
  end

  def get_data
    self.class.get("/find/upcoming_events?photo-host=public&page=50&sig_id=#{Rails.application.credentials.MEETUP_KEY}")
  end

  def events
    get_data.parsed_response
  end
end
  