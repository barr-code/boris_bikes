require 'van'

describe Van do
	let(:van) {Van.new(:capacity => 20)}

	it "should allow us to set a capacity" do
		expect(van.capacity).to eq(20)
	end
end
