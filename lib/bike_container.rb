module BikeContainer
	
	DEFAULT_CAPACITY = 10


	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value if (value.is_a? Fixnum) && value >= 0
	end
 # Even though bike_count is not strictly necessary,
 # We have decided to keep it because it is more concise than using bikes.count or available_bikes.count + broken_bikes.count
	def bike_count
		bikes.count
	end

	def dock(bike)
		raise 'There is no more room for bikes.' if full?
		raise 'Fuck off with your #{bike}. Only dock bikes here.' unless bike.class == Bike
		bikes << bike
	end

	def release
		raise 'There are no bikes in this holder.' if available_bikes.empty?
		bikes.delete(available_bikes.pop)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end
end