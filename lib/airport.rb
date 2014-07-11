require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 10

	attr_reader :name, :capacity, :landed_planes

	def initialize(options= {})
		@name = set_name
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@landed_planes = []
	end

	def request_landing(plane)
		land(plane) if landing_possible?
	end

	def land(plane)
		plane.land!
		landed_planes << plane 
	end

	def landing_possible?
		!full? and check_weather_conditions == :sunny
	end

	def request_take_off(plane)
		take_off(plane) if take_off_possible?
	end

	def take_off(plane)
		plane.take_off!
		landed_planes.delete(plane)
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

	def set_name
		[ "LHR", "SGP", "NYK", "LAX", "ZSH", "LGW", "SYD", "FFT"].sample
	end

end