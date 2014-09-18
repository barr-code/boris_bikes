require 'Docking_Station'

describe DockingStation do

	let(:station) {DockingStation.new(:capacity => 10)}
	let(:van) {Van.new(:capacity => 10)}
	let(:bike) {Bike.new}

	it "should allow setting default capacity" do
		expect(station.capacity).to eq(10)
	end

	it "should know when there are no bikes" do
		expect(station.bike_count).to eq(0)
		expect(station).to be_empty
	end

	it "should know when there are no available bikes" do
		expect(station.available_bikes).to be_empty
		expect(station).not_to have_rentals
	end

	it "should accept working bikes from the van" do
		expect(station.bike_count).to eq(0)
		van.dock(Bike.new)
		van.dock(Bike.new)
		station.accept_fixed_bikes(van)
		expect(station.bike_count).to eq(2)
	end

	it "should not accept fixed bikes if full" do
		10.times {station.dock(bike)}
		10.times {van.dock(bike)}
		expect(lambda {station.accept_fixed_bikes(van)}).to raise_error(RuntimeError)
	end

end