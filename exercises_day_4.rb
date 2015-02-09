=begin
class Fixnum
#	def to_s
#		puts "banana"
#	end
	def +(number)
		rand * number
	end
end

#5.to_s
#"hello".to_s

class Dummy
	def method_missing(m, *args, &block)
		puts "There/s no method called #{m} here -- please try again."
		args.each {|a| puts a} 
	end
end
Dummy.new.word(3, "bla", "bla", "bla")
=end

