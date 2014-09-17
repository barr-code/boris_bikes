require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def release_broken_bike
		bikes.delete(broken_bikes.pop)
	end
end