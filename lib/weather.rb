module Weather

	attr_accessor :weather



	def what_is_the_weather
		self.weather = 'Sunny' if rand < 0.7
			else
		self.weather = 'Stormy' 
	end

end