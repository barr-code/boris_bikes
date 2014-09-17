require 'van'
require 'bike'

describe Van do
	let(:van) {Van.new(:capacity => 20)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}


	it "should allow us to set a capacity" do
		expect(van.capacity).to eq(20)
	end

	it "should accept broken bikes from the Docking Station" do
		expect(van.bike_count).to eq(0)
		bike_1, bike_2 = Bike.new, Bike.new
		bike_1.break!
		bike_2.break!
		station.dock(bike_1)
		station.dock(bike_2)
		van.accept_broken_bikes(station)
		expect(van.broken_bikes.count).to eq(2)
	end

	it "should release broken bikes to the garage" do
		expect(van.bike_count).to eq(0)
		broken_bike = Bike.new
		broken_bike.break!
		van.dock(broken_bike)
		expect(van.bike_count).to eq(1)
		van.release_to_garage
		expect(van.bike_count).to eq(0)
	end

	it "should release working bikes to the docking station" do
		expect(station.bike_count).to eq(0)
		van.dock(bike)
		expect(van.bike_count).to eq(1)
		expect(van.broken_bikes).to be_empty
		station.dock(van.release)
		expect(station.bike_count).to eq(1)
		expect(van.bike_count).to eq(0)
	end

end
