class HomeController < ApplicationController
  def index
      @lat = 37.42
      @long = -122.07
      client = Foursquare2::Client.new(:client_id => ENV["client_id"], :client_secret => ENV["client_secret"])
      search = client.search_venues(:ll => "#{@lat},#{@long}", :query => 'coffee')
      @coffee_venues = search.groups[0].items
  end
end
