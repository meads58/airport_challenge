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

	def instruction_from_airport instruction
		land if instruction == 'land'
		fly if instruction == 'fly'
	end

end

