class Blog
	def initialize
		@posts = []
	end
		
	def front_page
		@posts.sort! {|a,b| b.date <=> a.date}
		@posts.each do |post|
			if post.sponsored
				puts "********#{post.title}********"
			else
				puts post.title
			end	
			puts post.date
			puts post.text
			puts "-------------"
		end
	end

	def add_post(title, text, date, sponsored = false)
		@posts << Post.new(title, text, date, sponsored)
	end

end

class Post
		
	attr_accessor :title, :text, :date, :sponsored

	def initialize(title, text, date, sponsored)
		@title = title
		@text = text
		@date = date
		@sponsored = sponsored
	end

end

blog = Blog.new
blog.add_post("Post title 1", "Post 1 text ", Time.now - 320)
blog.add_post("Post title 2", "Post 2 text ", Time.now - 600, true)
blog.add_post("Post title 3", "Post 3 text ", Time.now - 940)
blog.front_page
