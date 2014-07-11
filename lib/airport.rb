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
		landed_planes << plane if landing_possible?
	end

	def landing_possible?
		!full? and check_weather_conditions == :sunny
	end

	def request_take_off(plane)
		landed_planes.delete(plane) if take_off_possible?
	end

	def take_off_possible?
		!empty? and check_weather_conditions == :sunny
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