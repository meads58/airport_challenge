require_relative 'weather.rb'

class Airport

	include Weather

	CAPACITY = 9

	def initialize
		@weather = ""
	end

	def planes_in_airport
		@planes_in_aiprot ||= []
	end

	def weather_update weather
		self.weather = weather.status
	end

	def ok_to_land_plane 
		weather == 'Sunny' ? true : false
	end

	def ok_to_take_off
		weather == 'Sunny' ? true : false
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
