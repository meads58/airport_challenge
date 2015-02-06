require_relative 'weather.rb'

class Airport

	include Weather

	CAPACITY = 9

	def planes_in_airport
		@planes_in_aiprot ||= []
	end

	#def weather_update 
	#	weather = what_is_the_weather
	#end

	def ok_to_land 
		if what_is_the_weather == 'Sunny' && full? == false
			return true
		else
			return false
		end
	end

	def ok_to_take_off
		what_is_the_weather == 'Sunny' ? true : false
	end

	def park_plane plane
		raise "Aiport is full" if full?
		planes_in_airport << plane
	end

	def full?
		planes_in_airport.count == CAPACITY
	end

	def plane_status plane
		plane.status
	end


end
