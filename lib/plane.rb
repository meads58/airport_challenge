class Plane

	attr_accessor :flying

	def initialize
		@flying = true
	end
#question I don't want plane to land or fly unless instructed, how to you protect these mehtods?
	def fly
		@flying = true
	end

	def land
		@flying = false
	end

	def status
		flying ? "Flying" : "Landed"
	end

	def ask_airport_to_land aiport
		land if aiport.ok_to_land
	end

	def ask_airport_to_fly airport
		fly if airport.ok_to_fly
	end

end

