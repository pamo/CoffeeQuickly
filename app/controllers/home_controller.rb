class HomeController < ApplicationController
  def index
      @lat = 37.770820
      @long = -122.423736
      client = Foursquare2::Client.new(:client_id => ENV["client_id"], :client_secret => ENV["client_secret"])
      search = client.search_venues(:ll => "#{@lat},#{@long}", :query => 'coffee', :sortByDistance =>'1' )
      @coffee_venues = search.groups[0].items
      @coffee_venues.each do |v|
      	v.distance = v.location.distance * 0.00062137
      	v.distance = v.distance.round(3)
      	puts v.categories.first.name unless v.categories.first.nil?
      	v.here = client.herenow(v.id).hereNow["count"]
      	puts v.here
      	if v.here <= 0 
      		v.icon = "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
      	else
      		v.icon = "http://maps.google.com/mapfiles/ms/icons/red-dot.png"
  		end
      end
    end
end
