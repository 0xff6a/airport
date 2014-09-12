require 'plane'

describe Plane do

	let(:plane) 				{ Plane.new								}
	let(:landed_plane) 	{ Plane.new.land!					}
	let(:flying_plane) 	{ landed_plane.take_off!	}

	it 'has a flying status when created' do
		expect(plane).to be_flying
	end

	it 'can change status to land' do
		expect(landed_plane).not_to be_flying
	end

	it 'has a landed status when landed' do
		expect(landed_plane.status).to eq :landed
	end

	it 'can take off' do
		expect(flying_plane).to be_flying
	end
	
	it 'has a flying status when in the air' do
		expect(flying_plane.status).to eq :flying
	end

	it 'has a unique identifier' do
		expect(plane.id).not_to eq landed_plane.id
	end
	
end