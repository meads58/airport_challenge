require 'plane.rb'

describe Plane do

	let(:plane) { Plane.new }

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

end

