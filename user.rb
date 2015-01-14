class User

	attr_reader :name, :email, :twitter, :facebook

	def initialize(name, email = false, twitter = false, facebook = false)
		@name = name
		@email = email
		@twitter = twitter
		@facebook = facebook
	end
end

class NotificatorFactory
	def self.from_user(user)
		if user.email
			EmailNotificator.new
		elsif user.twitter
			TwitterNotificator.new
		elsif user.facebook
			FacebookNotificator.new
		else
			"no worky"
		end
	end
end

class EmailNotificator
	def send_message(message)
		message + "Blob! through Email"
	end
end
class TwitterNotificator
	def send_message(message)
		message + "Blob! through Twitter"
	end
end
class FacebookNotificator
	def send_message(message)
		message + " Blob! through Facebook"
	end
end


blob = User.new("Blob", false, false, "/blob")
notificator = NotificatorFactory.from_user(blob)
puts notificator.send_message "Hello"
