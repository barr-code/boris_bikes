require_relative 'bike_container'
require_relative 'docking_station'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def release_broken_bikes
		bikes.delete(broken_bikes.pop)
	end

	def accept_broken_bikes(station)
		raise 'The van is full!' if full?
		bikes << station.release_broken_bikes until station.broken_bikes == []
	end



end