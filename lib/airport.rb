require_relative 'weather.rb'

class Airport

include Weather

	CAPACITY = 9
	LANDED = 'Landed'
	FLYING = 'Flying'
	WEATHER_BAD = 'The weather is too stormy'


	def planes_in_airport
		@planes_in_airprot ||= []
	end

	def plane_status plane
		plane.status
	end
#if I change plane.land! I can't test this in aiport without require plane. What can be done?
	def land_plane plane
		raise "Aiport is full" if full?
		plane.land! if plane_status(plane) == FLYING
	end

	def take_off plane
			release_plane_from_airport(plane)
			#plane.take_off!
	end

	def ok_to_land? plane
		what_is_the_weather == 'Sunny' ? land_plane(plane) : WEATHER_BAD
	end

	def ok_to_take_off? plane
		what_is_the_weather == 'Sunny' ? take_off(plane) : WEATHER_BAD
	end

	def park_plane plane
		planes_in_airport << plane
	end

	def full?
		plane_count == CAPACITY
	end

	def release_plane_from_airport plane
		raise "No planes in airport" if plane_count == 0
		planes_in_airport.delete(plane)

	end

	def plane_count
		planes_in_airport.count
	end
end
