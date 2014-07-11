module Weather

	DEFAULT_WEATHER = :sunny
	STORM_PROBABILITY = 0.35

	def weather_conditions
		@conditions ||= DEFAULT_WEATHER
	end

	def check_weather_conditions
		@conditions = generate_random_conditions
	end
		
	def generate_random_conditions
		return :stormy if Random::rand < STORM_PROBABILITY
		:sunny
	end

end