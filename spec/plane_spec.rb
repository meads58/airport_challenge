require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }


	it "should be flying when created" do
		expect(plane.flying).to be true
	end

	it "should have a status of 'Landed' when landed" do
		plane.land!
		expect(plane.status).to eq "Landed"
	end

	it "should have a status of 'Flying' when flying" do
		expect(plane.status).to eq "Flying"
	end

	it "should land and change status to 'Landed'" do
		plane.land!
		expect(plane.status).to eq "Landed"
	end

	it "should take off and change status to 'Flying'" do
		plane.land!
		plane.take_off!
		expect(plane.status).to eq "Flying"
	end


end

