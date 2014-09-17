require 'Docking_Station'

describe DockingStation do

	let(:station) {DockingStation.new(:capacity => 20)}

	it "should allow setting default capacity" do
		expect(station.capacity).to eq(20)
	end

	it "should know when there are no bikes" do
		expect(station.bike_count).to eq(0)
		expect(station).to be_empty
	end

	it "should know when there are no available bikes" do
		expect(station.available_bikes).to be_empty
		expect(station).not_to have_rentals
	end

	it "should release broken bikes" do
		expect(station.bike_count).to eq(0)
		broken_bike = Bike.new
		broken_bike.break!
		station.dock(broken_bike)
		station.release_to_van
		expect(station.bike_count).to eq(0)
	end
	
end