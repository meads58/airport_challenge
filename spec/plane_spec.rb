require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }
	let(:airport_take_off) { double :airport, ok_to_fly: true  }
	let(:airport_to_land) { double :airport, ok_to_land_plane: true}

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
		plane.ask_airport_to_land(airport_to_land.ok_to_land_plane)
		expect(plane.status).to eq("Landed")
	end 

	it "should only fly when the airport tells it to fly" do
		plane.land
		plane.ask_airport_to_fly(airport_take_off.ok_to_fly)
		expect(plane.status).to eq ("Flying")
	end

end

