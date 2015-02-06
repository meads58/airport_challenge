require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }
	let(:airport) { double :airport, ok_to_land: true }

	it "should be flying when created" do
		expect(plane.flying).to be true
	end

	it "should not be flying when landed" do
		plane.land
		expect(plane.flying).not_to be true
	end

	it "should have a status of landed when landed" do
		plane.land
		expect(plane.status).to eq("Landed")
	end

	it "should have a status of flying when flying" do
		expect(plane.status).to eq("Flying")
	end

	it "should only land when the airport tells it to land" do
		plane.instruction_from_airport('land')
		expect(plane.status).to eq("Landed")
	end 

	it "should only fly when the airport tells it to fly" do
		plane.land
		plane.instruction_from_airport('fly')
		expect(plane.status).to eq ("Flying")
	end

end

