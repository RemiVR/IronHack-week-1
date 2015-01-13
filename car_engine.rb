=begin
class Car
	def car_noise
		"brooom"
	end
end

class Engine
	def engine_noise
		"woof"
	end
end

class Noise
	def make_noise
		Car.new.car_noise + Engine.new.engine_noise
	end
end

puts Noise.new.make_noise
=end

#========= oTHER WAY ========

=begin
class Car
	def car_noise
		"brooom"
	end
	def make_noise
		car_noise + Engine.new.engine_noise
	end
end

class Engine
	def engine_noise
		"woof"
	end
end


car_1 = Car.new
puts car_1.make_noise
=end

#And another way ===================

class Car
	def car_noise
		"brooom"
	end

	def engine_noise
		"woof"
	end

	def make_noise
		car_noise + engine_noise
	end
end

car_1 = Car.new
puts car_1.make_noise
