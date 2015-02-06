class Plane

	attr_accessor :flying

	def initialize
		@flying = true
	end


	def land
		@flying = false
	end

	def status
		flying ? "Flying" : "Landed"
	end

end

