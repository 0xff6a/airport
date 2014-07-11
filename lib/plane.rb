class Plane

	attr_accessor :status, :id

	def initialize
		@id = generate_id
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

	def generate_id
		"#{[*('A'..'Z')].sample(2).join} #{Random::rand(999).to_s}"
	end

end