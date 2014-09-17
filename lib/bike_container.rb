module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise 'There is no more room for bikes.' if full?
		raise 'That is not a bike. Please only dock bikes.' unless bike.class == Bike
		bikes << bike
	end

	def release
		raise 'There are no bikes in this holder.' if available_bikes.empty?
		bikes.delete(available_bikes.pop)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end
end