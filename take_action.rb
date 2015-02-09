class Car

	def initialize
		@position = [0,0]
	end

	def go_forward(distance)
		Forward.new(@position,distance)
	end
end

class Forward

	def initialize(position, distance)
		@pos_x = position[0]
		@pos_y = position[1]
		@distance = distance
	end
	def execute
		@position = [@pos_x, @pos_y + distance]
	end

	def unexecute
		@position = [@pos_x, @pos_y - distance]
	end
end

car = Car.new
p car.go_forward(10)
p car.go_forward(5) 