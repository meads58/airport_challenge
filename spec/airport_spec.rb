require 'airport'

describe Airport do

	WEATHER_BAD = 'The weather is too stormy'
	WEATHER_GOOD = 'All clear, weather is sunny'

	def park_planes_helper plane, number
		number.times { airport.park_plane(plane) }
	end

	def take_off_helper plane, number
		number.times { airport.take_off(plane) }
	end

	def land_and_park_plane_in_sunny_weather plane, expected_plane_count
		expect(airport).to receive(:what_is_the_weather).and_return('Sunny')
		expect(plane).to receive(:land!)
		airport.land_plane(plane)
		expect(airport.plane_count).to eq expected_plane_count
	end

	def deny_landing_in_stormy_weather plane, expected_plane_count
		expect(airport).to receive(:what_is_the_weather).and_return('Stormy')
		expect(plane).not_to receive(:land!)
		airport.land_plane(plane)
		expect(airport.plane_count).to eq expected_plane_count
	end

	def take_off_and_release_plane_from_airport plane, expected_plane_count
		expect(airport).to receive(:what_is_the_weather).and_return('Sunny')
		expect(plane).to receive(:take_off!)
		airport.take_off plane
		expect(airport.plane_count).to eq expected_plane_count
	end

	def deny_take_off_in_stormy_weather plane, expected_plane_count
		expect(airport).to receive(:what_is_the_weather).and_return('Stormy')
		expect(plane).not_to receive(:take_off!)
		airport.take_off plane
		expect(airport.plane_count).to eq expected_plane_count
	end


	let(:airport) { Airport.new }
	let(:landed_plane) { double :plane, status: 'Landed'}
	let(:flying_plane) { double :plane, status: 'Flying'}

#=======================================================================================
#how do you create different planes in a helper each with a different instance variable name?
	let(:plane1) { double :plane }
	let(:plane2) { double :plane }
	let(:plane3) { double :plane }
	let(:plane4) { double :plane }
	let(:plane5) { double :plane }
	let(:plane6) { double :plane }
	let(:plane7) { double :plane }
	let(:plane8) { double :plane }


	context 'Airport' do

		it "knows how to park a plane" do
			airport.park_plane landed_plane
			expect(airport.planes_in_airport.count).to eq 1
		end

		it "knows how to release a plane" do
			airport.park_plane landed_plane
			expect(airport.plane_count).to eq 1
			airport.release_plane_from_airport landed_plane
			expect(airport.plane_count).to eq 0
		end

		it "knows a plane can take off and be released" do
			airport.park_plane landed_plane
			expect(airport).to receive(:what_is_the_weather).and_return('Sunny')
			expect(landed_plane).to receive(:take_off!)
			airport.take_off landed_plane
		end

		it "should not release a plane if there are no planes" do
			expect { airport.release_plane_from_airport landed_plane }.to raise_error(RuntimeError, 'No planes in airport')
		end

	end

	context 'Traffic Control' do

		it "should be able to get the status of flying and landed planes" do
			expect(airport.plane_status flying_plane).to eq 'Flying'
			expect(airport.plane_status landed_plane).to eq 'Landed'
		end

		it "should not let a plane land in a storm" do
			expect(airport).to receive(:what_is_the_weather).and_return('Stormy')
			expect(airport.ok_to_land?).to eq WEATHER_BAD
		end

		it "should not allow a plane to take off in a storm" do
			expect(airport).to receive(:what_is_the_weather).and_return('Stormy')
			expect(airport.ok_to_take_off?).to eq WEATHER_BAD
		end

		it "should allow a plane to take off when sunny" do
			expect(airport).to receive(:what_is_the_weather).and_return('Sunny')
			expect(airport.ok_to_take_off?).to eq WEATHER_GOOD
		end

		it "should allow a plane to land when sunny" do
			expect(airport).to receive(:what_is_the_weather).and_return('Sunny')
			expect(airport.ok_to_land?).to eq WEATHER_GOOD
		end

		it "should not let a plane land if aiport is full" do
			park_planes_helper landed_plane, 9
			expect{ airport.land_plane landed_plane }.to raise_error(RuntimeError, 'Aiport is full')
		end

	end

	context 'Grand Final' do

		it "should let 6 planes land and take off in sunny weather only" do

			land_and_park_plane_in_sunny_weather plane1, 1
			land_and_park_plane_in_sunny_weather plane2, 2
			land_and_park_plane_in_sunny_weather plane3, 3
			land_and_park_plane_in_sunny_weather plane4, 4
			deny_landing_in_stormy_weather plane7, 4
			land_and_park_plane_in_sunny_weather plane5, 5
			land_and_park_plane_in_sunny_weather plane6, 6
			take_off_and_release_plane_from_airport plane6, 5
			take_off_and_release_plane_from_airport plane5, 4
			take_off_and_release_plane_from_airport plane4, 3
			deny_take_off_in_stormy_weather plane7, 3 #=========WHY DOES PLANE3 NOT WORK HERE?????====
			take_off_and_release_plane_from_airport plane3, 2
			take_off_and_release_plane_from_airport plane2, 1
			take_off_and_release_plane_from_airport plane1, 0
		end

	end
end



=begin
q-release
it "should release and let plane take off" do
	airport.park_plane landed_plane
	expect(airport.plane_count).to eq 1
	allow(landed_plane).to receive(:take_off!)
	airport.take_off landed_plane
	expect(airport.plane_count).to eq 0
end

=end


