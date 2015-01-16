class CommandLineTool

	def initialize
		@user = User.new
	end

	def start
		print "Username > "
		@usernameInput = gets.chomp
		print "Password > "
		@passwordInput = gets.chomp

		if @user.check(@usernameInput, @passwordInput)
			puts @message = MessageProcessor.new.start
		else
			puts "Authentication Failed (Fuck you)"
		end
	end


end

class	User
	def initialize
		@users = [
			{username: 'hector', password: '1234'},
			{username: 'remi', password: '5678'},
			{username: 'helena', password: '4321'},
			{username: 'adri', password: '8765'}
		]
	end

	def check(username, password)
		check_username(username) && check_password(password)
	end

	private
	def check_username(username)
		@coincidences = []
		@users.each do |user|
			username == user[:username] ? @coincidences << username : false
		end
		@coincidences.first
	end

	def check_password(password)
		true
	end
end

class MessageProcessor
	def start(ask = true)
		ask_for_sentence unless !ask
		option = Menu.new.options
		execute(option)
	end

	private
	def ask_for_sentence
		print "Write your message in here > "
		@message = gets.chomp
	end

	def execute(option)

		case option
		when 1
			count_words(@message)
		when 2
			count_letters(@message)
		when 3
			reverse(@message)
		when 4
			uppercase(@message)
		when 5
			lowercase(@message)
		else
			start(false)
		end
	end

	private
	def count_words(message)
		message.split(' ').count
	end

	def count_letters(message)
		message.split(' ').join.chars.count
	end

	def reverse(message)						#divide into classes
		message.reverse
	end

	def uppercase(message)
		message.upcase
	end

	def lowercase(message)
		message.downcase
	end
end

class Menu
	def options
		print_options
		ask_for_option
	end

	private
	def print_options
		puts "Available options: (1) count words, (2) count letters, (3) reverse, (4) uppercase, (5) lowercase."
	end

	def ask_for_option
		print "> "
		@option = gets.chomp.to_i
	end
end

clt = CommandLineTool.new()
clt.start