require 'Docking_Station'

describe DockingStation do

	let(:station) {DockingStation.new(:capacity => 20)}

	it "should allow setting default capacity" do
		expect(station.capacity).to eq(20)
	end
end