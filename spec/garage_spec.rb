require 'garage'

describe Garage do

	let(:garage) {Garage.new(:capacity => 20)}
	let(:van) {Van.new(:capacity => 20)}
	let(:bike) {Bike.new}

	it "should have a default capacity" do
		expect(garage.capacity).to eq(20)
	end

	
end