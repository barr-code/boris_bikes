require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	def fill_holder(holder)
		10.times {holder.dock(bike)}
	end

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release
		expect(holder.bike_count).to eq(0)
	end

	it "should not release a bike if empty" do
		expect(holder.bike_count).to eq(0)
		expect(lambda {holder.release}).to raise_error(RuntimeError)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		10.times {holder.dock(bike)}
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder(holder)
		expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
	end

	it "should not accept things that aren't bikes" do
		expect(lambda {holder.dock(:bike)}).to raise_error(RuntimeError)
	end


	it "should release without an argument" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		holder.release
		expect(holder.bike_count).to eq(0)
	end

	it "should know which bikes are available" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should know which bikes are broken" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should resort to default capacity if capacity entered isn't a number" do
		holder.capacity="dog"
		expect(holder.capacity).to eq(10)
	end

	it "shouldn't have a negative capacity" do
		holder.capacity= -1
		expect(holder.capacity).to eq(10)
	end

end