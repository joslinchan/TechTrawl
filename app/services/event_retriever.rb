class EventRetriever
  include HTTParty
  base_uri "api.meetup.com"
  
  def get_data
    self.class.get("/find/upcoming_events?photo-host=public&page=40&sig_id=255484866&sig=adb9e61e59dc2e4b781b9eaa39fe0190fbabd7f5")
  end

  def events
    get_data.parsed_response
  end
end
  