class CarTransport
	include Enumerable

	def initialize
		@list = [] #create an array
	end

	def add_cars(make, sound)
		@list << Car.new(make, sound) #push cars into the array
	end

	def each(&block)
		@list.each(&block) #runs thru the array each item
	end
end

class Car
	
	attr_accessor :make, :sound

	def initialize(make, sound) #make a new object "Car"
		@make = make
		@sound = sound
	end

	def print
		puts "The car " + make + " does " + sound
	end

	def sound # Make a sound method to be able to use the SOUND value
		@sound
	end

	def <=>(other_car)
		@sound.length <=> other_car.sound.length #Compare two values to each other by the .length of the string
	end
end
=begin
street_car = Car.new("Ford", "Broooom")
race_car = Car.new("Ferrari", "Broooooooom")
old_car = Car.new("Fiat", "ZZZS")
=end

transport = CarTransport.new
transport.add_cars ("Ford", "Broooom")
transport.add_cars ("Ferrari", "Broooooooom")
transport.add_cars ("Fiat", "ZZZS")

puts transport.max.sound
transport.each {|a| a.print}