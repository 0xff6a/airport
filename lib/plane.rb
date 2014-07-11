class Plane

	attr_accessor :status

	def initialize
		@status = :flying
	end

	def flying?
		@status == :flying
	end

	def land!
		@status = :landed
		self
	end

	def take_off!
		@status = :flying
		self
	end

end