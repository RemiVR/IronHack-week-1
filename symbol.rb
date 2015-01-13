my_hash{name: "Remi", surname: "VR"}
puts my_hash



#module
module My_module
	def my_included_method
		puts "HI!!"
	end
end

class MyClass
	def class_method
		puts "I'm a class method"
	end
end

my_object = MyClass.new

class MyClass
	include My_module
	def class_method
		puts "I'm an instnce method"
	end
end