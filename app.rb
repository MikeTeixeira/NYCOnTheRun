require 'sinatra'
require 'eventful/api'





 begin

  api_key = ENV['EVENTFUL_API_KEY'];
   # Start an API session with a username and password
   eventful = Eventful::API.new api_key,
                                :user => 'username',
                                :password => 'password'

   # Lookup an event by its unique id
   event = eventful.call 'events/get',
                         :id => 'E0-001-001042544-7'

   @newevent = eventful.call 'events/search',
                            :keywords => "marathon",
                            :location => "new york city"                      

   puts "Event Title: #{event['title']}"

   # Get information about that event's venue
   venue = eventful.call 'venues/get',
                         :id => event['venue_id']

   puts "Venue: #{venue['name']}"

rescue Eventful::APIError => e
   puts "There was a problem with the API: #{e}"
 end



get "/" do  
  puts @newevent           
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