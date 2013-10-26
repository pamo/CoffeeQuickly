class HomeController < ApplicationController
  def index
      # @lat = 37.770820
      # @long = -122.423736
      @lat = 40.733556
      @long = -73.991520

      client = Foursquare2::Client.new(:client_id => ENV["client_id"], :client_secret => ENV["client_secret"])
      search = client.search_venues(:ll => "#{@lat},#{@long}", :query => 'coffee', :sortByDistance =>'1' )
      @coffee_venues = search.groups[0].items
      @coffee_venues.each do |v|
      	v.distance = v.location.distance * 0.00062137
      	v.distance = v.distance.round(3)
      	v.here = client.herenow(v.id).hereNow["count"]
      	
      	all_photos = client.venue(v.id).photos.groups[1]
		photos = all_photos.items unless all_photos.nil?
		photos.each { |p| v.photo = p.sizes.items[-2].url } unless photos.nil?		

		if v.here < 2 
      		v.icon = "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
      	else
      		v.icon = "http://maps.google.com/mapfiles/ms/icons/red-dot.png"
  		end
      end
    end
end
