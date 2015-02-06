class Airport

	CAPACITY = 9

	attr_accessor :weather

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

end
