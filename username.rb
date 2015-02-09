=begin
class User
	def initialize(username, password)
		@username = username
		@password = password
		@user = []
	end
	def input(username, password)
		@user << User.new(username,password)
		print "Please enter username"
		@username_input = gets.chomp
		print "Please enter password"
		@password_input = gets.chomp
	end
	def verify(username,password)
		
	end
end
=end


		@users_list = [["hector","1234"],["remi","5678"]]

		@users_list[0][1]

		if "hector" == @users_list[0][0] && "1567" == @users_list[0][1]
			puts "work"
		else
			puts "Authentication Failed"
		end
