require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 10

	attr_reader :capacity, :landed_planes

	def initialize(options= {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@landed_planes = []
	end

	def request_landing(plane)
		landed_planes << plane unless full?
	end

	def request_take_off(plane)
		landed_planes.delete(plane)
	end

	def full?
		plane_count >= capacity
	end

	def empty?
		landed_planes.empty?
	end

	def plane_count
		landed_planes.count 
	end

end