class Airport

	attr_accessor :weather

	def initialise
		@weather = ""
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
end
