require 'van'

describe Van do
	let(:van) {Van.new(:capacity => 20)}

	it "should allow us to set a capacity" do
		expect(van.capacity).to eq(20)
	end

	it "should release broken bikes to the garage" do
		expect(van.bike_count).to eq(0)
		broken_bike = Bike.new
		broken_bike.break!
		van.dock(broken_bike)
		expect(van.bike_count).to eq(1)
		van.release_broken_bike
		expect(van.bike_count).to eq(0)
	end
end
