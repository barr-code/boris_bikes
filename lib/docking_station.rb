require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def empty?
		bike_count == 0
	end

	def has_rentals?
		!available_bikes.empty?
	end

	def release_broken_bikes
		bikes.delete(broken_bikes.pop)
	end

	def accept_fixed_bikes(van)
		bikes << van.release until van.available_bikes == []
	end

end