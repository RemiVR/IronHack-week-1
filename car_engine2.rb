class Car
	def initialize(engine)
		@engine = engine
	end

	def make_noise
		puts "brooom"+@engine.noise
	end
end

class Engine
	def noise
		"woof"
	end

end


car_1 = Car.new(Engine.new)
puts car_1.make_noise

class Dog
	def noise
		"bark"
	end
end

car_1 = Car.new(Dog.new)
puts car_1.make_noise