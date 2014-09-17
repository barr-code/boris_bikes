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

end