require_relative 'weather.rb'

class Airport

	include Weather

	CAPACITY = 9
	LANDED = 'Landed'
	FLYING = 'Flying'


	def planes_in_airport
		@planes_in_aiprot ||= []
	end

	def plane_can_land plane
		plane.land if plane.status == FLYING
	end

	def plane_can_take_off plane
		plane.take_off if plane.status == LANDED
	end

	def ok_to_land? plane
		plane_can_land plane if what_is_the_weather == 'Sunny'
	end

	def ok_to_take_off? plane
		plane_can_take_off plane if what_is_the_weather == 'Sunny'
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
