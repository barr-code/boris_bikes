require_relative 'bike'
require_relative 'docking_station'

class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		@bike != nil
	end

	def rent_bike_from(station)
		@bike = station.release
	end

	def return_bike_to(station)
		station.dock(@bike)
		@bike = nil
	end

	def crash(bike)
		@bike.break!
	end

end