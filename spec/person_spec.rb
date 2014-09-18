require 'person'

describe Person do

	let(:person) {Person.new}

	it "should not have a bike" do
		expect(person).not_to have_bike
	end
	
end