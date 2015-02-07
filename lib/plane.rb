class Plane

	attr_accessor :flying

	def initialize
		@flying = true
	end
#question I don't want plane to land or fly unless instructed, how to you protect these mehtods?
	def take_off
		@flying = true
	end

	def land
		@flying = false
	end

	def status
		flying ? "Flying" : "Landed"
	end



end

