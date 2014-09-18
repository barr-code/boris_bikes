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
	
end