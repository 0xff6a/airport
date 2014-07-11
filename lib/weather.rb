module Weather

	DEFAULT_WEATHER = :sunny
	DEFAULT_STORM_PROBABILITY = 0.25

	def weather_conditions
		@conditions ||= DEFAULT_WEATHER
	end

	def check_weather_conditions
		@conditions = generate_random_conditions
	end
		
	def generate_random_conditions
		return :stormy if Random::rand < DEFAULT_STORM_PROBABILITY
		:sunny
	end

end