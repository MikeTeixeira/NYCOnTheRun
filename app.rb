require 'sinatra'
require 'eventful/api'
require 'dotenv/load'
require 'sendgrid-ruby'

begin


  sendgrid_api = "kCSn-3M5SceqmYn8t3F8kA";

  api_key = ENV['EVENTFUL_API_KEY'];
   # Start an API session with a username and password
   eventful = Eventful::API.new api_key,
                                :user => 'username',
                                :password => 'password'



   # Lookup an event by its unique id
   # event = eventful.call 'events/get',
   #                       :id => 'E0-001-107504950-0'
 
                     
   $newevent = eventful.call 'events/search',
                            :keywords => "marathon",
                            :location => "new york city",
                            :sort_order => "date",
                            :sort_direction => "descending"

    $ids = $newevent["events"]["event"].map{|event_id| event_id["id"]}
                
   # puts "Event Title: #{event['title']}"

  # puts "Venue: #{venue['name']}"

rescue Eventful::APIError => e
  puts "There was a problem with the API: #{e}"
end

before do 
  @class = ""
end


get "/" do  
  $newevent = eventful.call 'events/search',
                            :keywords => "running marathon",
                            :location => "new york city",
                            :sort_order => "date",
                            :sort_direction => "descending"

  $event = $newevent["events"]["event"]
  $dates = $newevent["events"]["event"].map{|event_date| event_date["start_time"]}
  $titles = $newevent["events"]["event"].map{|event_title| event_title["title"]}
  $venue_address = $newevent["events"]["event"].map{|venue_address| venue_address["venue_address"]}
  $url = $newevent["events"]["event"].reject do |event| 
    !event["image"] || !event["image"]["small"] || !event["image"]["small"]["url"]
  end.map{|event| event["image"]["small"]["url"] }

  puts $newevent

  @class = "home"       
  erb :home
end

get "/contact" do
  @class = "contact"
 erb :contact
end

post "/contact" do
  #   from = Email.new(params["email"])
  #   to = Email.new(email: 'teixeiramichael5@gmail.com')
  #   subject = (params["subject"])
  #   content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  #   mail = Mail.new(from, subject, to, content)

  #   sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  # puts response.status_code
  # puts response.body
  # puts response.headers
end

get "/runners" do
  @class = "runners"
 erb :runners
end

get "/map" do
  @class = "map"
 erb :map
end

get "/runners_blog" do
 erb :blogs
end
