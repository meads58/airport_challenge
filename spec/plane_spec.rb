require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }
	let(:airport_take_off) { double :airport, ok_to_fly: true , ok_to_land_plane: false }
	let(:airport_to_land) { double :airport, ok_to_land_plane: true, ok_to_fly: false}

	it "should be flying when created" do
		expect(plane.flying).to be true
	end

	it "should have a status of landed when landed" do
		plane.land
		expect(plane.status).to eq "Landed"
	end

	it "should have a status of flying when flying" do
		expect(plane.status).to eq "Flying"
	end

	it "should land when the airport says ok to land" do
		plane.ask_airport_to_land(airport_to_land.ok_to_land_plane)
		expect(plane.status).to eq "Landed"
	end

	it "should not land if airport does not allow it" do
		plane.ask_airport_to_land(airport_take_off.ok_to_land_plane)
		expect(plane.status).to eq "Flying"
	end 

	it "should take off when the airport tells it" do
		plane.land
		plane.ask_airport_to_fly(airport_take_off.ok_to_fly)
		expect(plane.status).to eq "Flying"
	end

	it "should not take off if airport does not allow it" do
		plane.land
		plane.ask_airport_to_land(airport_to_land.ok_to_fly)
		expect(plane.status).to eq "Landed"
	end

end

