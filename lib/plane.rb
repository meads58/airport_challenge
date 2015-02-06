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

	def ask_airport_to_land instruction
		land if instruction
	end

	def ask_airport_to_fly instruction
		fly if instruction
	end

end

