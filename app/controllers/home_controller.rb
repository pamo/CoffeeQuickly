class HomeController < ApplicationController
  def index
      puts ENV["client_id"]
      puts ENV["client_secret"]
      
      client = Foursquare2::Client.new(:client_id => ENV["client_id"], :client_secret => ENV["client_secret"])
      puts client
      #puts client.search_venues(:ll => '36.142064,-86.816086', :query => 'Starbucks')
  end
end
