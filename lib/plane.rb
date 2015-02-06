class Plane

	attr_accessor :flying

	def initialize
		@flying = true
	end

	def fly
		@flying = true
	end

	def land
		@flying = false
	end

	def status
		flying ? "Flying" : "Landed"
	end

	def ask_airport_to_land instructed
		land if instructed
	end

	def ask_airport_to_fly instructed
		fly if instructed
	end

end

