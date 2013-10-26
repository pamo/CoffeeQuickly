class HomeController < ApplicationController
  def index
      @lat = 37.770820
      @long = -122.423736
      client = Foursquare2::Client.new(:client_id => ENV["client_id"], :client_secret => ENV["client_secret"])
      search = client.search_venues(:ll => "#{@lat},#{@long}", :query => 'coffee', :sortByDistance =>'1' )
      @coffee_venues = search.groups[0].items
      @coffee_venues.each do |v|
      	puts v.categories.first.name unless v.categories.first.nil?
      end
    end
end
