require 'sinatra'
require 'eventful/api'


begin

 api_key = ENV['EVENTFUL_API_KEY'];
  # Start an API session with a username and password
  eventful = Eventful::API.new api_key,
                               :user => 'username',
                               :password => 'password'

  # Lookup an event by its unique id
  # event = eventful.call 'events/get',
  #                       :id => 'E0-001-107504950-0'

                   
  $newevent = eventful.call 'events/search',
                           :keywords => "running marathon",
                           :location => "new york city"

   $ids = $newevent["events"]["event"].map{|event_id| event_id["id"]}
   $dates = $newevent["events"]["event"].map{|event_date| event_date["start_time"]}
   $titles = $newevent["events"]["event"].map{|event_title| event_title["title"]}
   $venue_address = $newevent["events"]["event"].map{|venue_address| venue_address["venue_address"]}   
   $url = $newevent["events"]["event"].map{|url| url["url"]}                 

  # puts "Event Title: #{event['title']}"

  # Get information about that event's venue
  # venue = eventful.call 'venues/get',
  #                       :id => event['venue_id']

  # puts "Venue: #{venue['name']}"

# rescue Eventful::APIError => e
#   puts "There was a problem with the API: #{e}"
end




get "/" do  
 $newevent = eventful.call 'events/search',
                           :keywords => "running marathon",
                           :location => "new york city"
 $dates = $newevent["events"]["event"].map{|event_date| event_date["start_time"]}
 puts $dates    
 puts $titles  
 puts $url                    
       
erb :home
end

get "/contact" do
 erb :contact
end

get "/images" do
 erb :images
end

get "/runners_blog" do
 erb :blogs
end
