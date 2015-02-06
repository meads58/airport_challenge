require 'airport'

describe Airport do

	def new_planes_helper
	end
	def park_planes_helper plane, number
		number.times { airport.park_plane(plane) }
	end

	def take_off_helper plane, number
		number.times { airport.take_off(plane) }
	end

	let(:airport) { Airport.new }
	let(:plane) { double :plane }
	let(:landed_plane) { double :plane, status: 'Landed'}
	let(:flying_plane) { double :plane, status: 'Flying'}
	let(:weather) { double :weather }
	let(:sunny_weather) { double :weather }
	let(:stormy_weather) { double :weather }


	it "should tell a plane to land when sunny" do
		allow(airport).to receive(:what_is_the_weather).and_return('Sunny')
		expect(airport.ok_to_land).to be true
	end

	it "should not let a plane land in a storm" do
		allow(airport).to receive(:what_is_the_weather).and_return('Stormy')
		expect(airport.ok_to_land).to be false
	end

	it "should allow a plane take off when sunny" do
		allow(airport).to receive(:what_is_the_weather).and_return('Sunny')
		expect(airport.ok_to_take_off).to be true
	end

	it "should not allow a plane to take off in a storm" do
		allow(airport).to receive(:what_is_the_weather).and_return('Stormy')
		expect(airport.ok_to_take_off).to be false
	end

	it "should not let a plane land if aiport is full" do
		park_planes_helper plane, 9
		expect{ airport.park_plane(plane) }.to raise_error(RuntimeError, 'Aiport is full')
	end

	it "should let 6 planes land in airport" do
		park_planes_helper landed_plane, 6
		expect(airport.planes_in_airport.count).to eq 6
		expect(landed_plane).to receive(:status)
		airport.plane_status(landed_plane)
	end

	it "should allow 6 planes to take off" do
		
	end

end