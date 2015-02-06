require 'airport'

describe Airport do

	let(:airport) { Airport.new }
	let(:sunny_weather) { double :weather, status: 'Sunny' }
	let(:stormy_weather) { double :weather, status: 'Stormy' }

	it "knows when it is sunny" do
		airport.weather_update(sunny_weather)
		puts airport.weather
		expect(airport.weather).to eq('Sunny')
	end

	it "knows when there is a storm" do
		airport.weather_update(stormy_weather)
		expect(airport.weather).to eq('Stormy')
	end

	it "should tell a plane to land when sunny" do
		airport.weather_update(sunny_weather)
		expect(airport.ok_to_land_plane).to be true
	end

	it "should not let a plane land in a storm" do
		airport.weather_update(stormy_weather)
		expect(airport.ok_to_land_plane).to be false
	end

	it "should allow a plane take off when sunny" do
		airport.weather_update(sunny_weather)
		expect(airport.ok_to_take_off).to be true
	end

	it "should not allow a plane to take off in a storm" do
		airport.weather_update(stormy_weather)
		expect(airport.ok_to_take_off).to be false
	end

	it "should not let a plane land if aiport is full" do
	end



end