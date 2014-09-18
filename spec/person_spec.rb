require 'person'

describe Person do

	let(:person) {Person.new}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}

	it "should not have a bike" do
		expect(person).not_to have_bike
	end

	it "should be able to rent a bike" do
		station.dock(bike)
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it "should be able to return the bike" do
		person = Person.new(Bike.new)
		station = DockingStation.new
		person.return_bike_to(station)
		expect(station.bike_count).to eq(1)
		expect(person).not_to have_bike
	end

	it "should break the bike if it crashes" do
		station.dock(bike)
		person.rent_bike_from(station)
		person.crash(bike)
		expect(bike).to be_broken
	end
	
end