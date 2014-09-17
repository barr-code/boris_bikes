require_relative 'bike_container'
require_relative 'docking_station'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def release_to_garage
		bikes.delete(broken_bikes.pop)
	end

	def accept_broken_bikes(station)
		raise 'The van is full!' if full?
		bikes << station.release_to_van until station.broken_bikes == []
	end



end