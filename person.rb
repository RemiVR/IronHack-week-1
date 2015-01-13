class Person
	def initialize(name, age)
		@name = name
		@age = age
	end

	def name
		puts @name
	end

	def age
		puts @age
	end

	def age=(new_age)
		@age = new_age
	end

	def name=(new_name)
		puts "Name is read only"
	end
end
person1 = Person.new("Remi", 23)
person2 = Person.new("Sharon", 28)
person1.age = 35
person1.name = "mickey"
person2.age = 16
person2.age
