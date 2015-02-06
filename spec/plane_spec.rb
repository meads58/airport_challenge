require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }

	it "should be flying when created" do
		expect(plane.flying).to be true
	end

	it 'should be able to land' do
		plane.land
		expect(plane.flying).not_to be true
	end

	it 'should be able to provide flying status when flying' do
		expect(plane.status).to eq "Flying"
	end

	it 'should be able to provide a landed status when landed' do
		plane.land
		expect(plane.status).to eq "Landed"
	end

end