require 'airport'
require 'weather_spec'

describe Airport do
	
	BIG_CAPACITY = 100

	let(:airport) { Airport.new }
	let(:plane) { double :plane }

	before(:each) do
		allow(airport).to receive(:check_weather_conditions).and_return(:sunny)
	end

	it_should_behave_like 'area with changing weather'

	context 'capacity:' do

		it 'has a default maximum capacity' do
			expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
		end

		it 'can have capacity set at initialisation' do
			big_airport = Airport.new(capacity: BIG_CAPACITY)
			expect(big_airport.capacity).to eq BIG_CAPACITY
		end

		it 'can store planes' do
			expect(airport.landed_planes).to eq []
		end

		it 'knows when it is full' do
			fill_airport
			expect(airport).to be_full
		end

		it 'knows when it is empty' do
			expect(airport).to be_empty
		end
			
	end

	context 'taking off and landing:' do

		it 'a plane can land' do
			airport.request_landing(plane)
			expect(airport.landed_planes).to eq [plane]
		end

		it 'a plane can take off' do
			airport.request_landing(plane)
			airport.request_take_off(plane)
			expect(airport).to be_empty
		end

	end

	context 'traffic control' do

		it 'a plane cannot land if the airport is full' do
			fill_airport
			airport.request_landing(plane)
			expect(airport.plane_count).to eq airport.capacity
		end

		it 'should check if landing is possible' do
			expect(airport.landing_possible?).to be true
		end

	end

	context 'weather conditions' do
		
		it 'a plane cannot take off when there is a strom brewing' do
			airport.request_landing(plane)
			allow(airport).to receive(:check_weather_conditions).and_return(:stormy)
			airport.request_take_off(plane)
			expect(airport.landed_planes).to eq [plane]
		end

		it 'a plane cannot land in the middle of a storm' do
			allow(airport).to receive(:check_weather_conditions).and_return(:stormy)
			airport.request_landing(plane)
			expect(airport).to be_empty
		end

	end

	def fill_airport
		airport.capacity.times{ airport.request_landing(plane) }
	end

end