require 'weather'

shared_examples 'area with changing weather' do
	
	let(:area) { described_class.new }

	it 'should be sunny initially' do
		expect(area.weather_conditions).to be :sunny
	end

	it 'can change to stormy' do
		allow(area).to receive(:generate_random_conditions).and_return(:stormy)
		area.check_weather_conditions
		expect(area.weather_conditions).to be :stormy
	end

end