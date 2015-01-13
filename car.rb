class Car


	def initialize(sound, color)
		@sound = sound
		@color = color
		newnum = IO.read("total.txt").to_i + 1
		IO.write("total.txt", newnum)
	end

	def noise
		@sound
	end

	def color
		puts @color
	end
end

class Racing < Car

	def initialize
		super("BROOOOOOM", "red")
	end
end


my_car = Car.new("broom", "blue")
your_car = Car.new("BROOOOOOM", "pink")
old_car = Car.new("roaaaar", "white")
racing_car = Racing.new
losing_car = Racing.new

#[my_car, your_car, old_car].each do |item| item.noise
#end 

=begin
cars = []
sounds = ["Broom", "Meek", "Nyan"]
sounds.each do |sound|
	cars << Car.new(sound, "red")
end
cars.each do |car| 
	car.noise
end
=end

=begin
sounds = ["Broom", "Meek", "Nyan"].map do |sound| Car.new(sound, "red")
end
puts cars
=end

=begin
new_hash=["Broom", "Meek", "Nyan"].each_with_object({}) do |sound, cars|
	cars[sound] = Car.new(sound, "red")
end
=end

car_sounds = [my_car, your_car, old_car].reduce("") {|sum, car| sum + car.noise}
puts car_sounds