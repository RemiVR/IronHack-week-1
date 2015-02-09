require 'time'
require 'pp'

class Srt
	include Enumerable
	attr_accessor :file
	attr_reader :line_elements
	def initialize(file)
		@file = IO.read(file)
	end

	def split_into_elements(delay_time)
		@sequence_elements = @file.split("\r\n\r\n")
		@line_elements =  @sequence_elements.map {|a| a.split("\r\n")}
		@time_element = @line_elements[0][1]
		@times = @time_element.split(" --> ")
		@time_shift = @times.map{|a| DateTime.parse(a) + delay_time.to_i/(24*60*60*1000).to_f }

		@time_shift[0].strftime("%T,%L") + " --> " + @time_shift[1].strftime("%T,%L")
	end
end
class Typos
	def initialize(srt_object, dictionary)
		@line_elements = srt_object.line_elements
		#IO.write("potential_typos.txt")
		@dictionary = IO.read(dictionary)
	end

	def make_content_hash
		container_hash = {}
		@line_elements.each do |sub_block|
			container_hash[sub_block[1]] = remove_punctuation(sub_block.last.split(" "))
		end
		container_hash
	end

	def remove_punctuation(array_puncutuated)
		array_puncutuated.join(" ").downcase.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '').split(" ")
	end

	def check
		make_content_hash.each do |time, words|
			words.each do |word|
				if !@dictionary.include?(word)
					write_my_file(time, word)
				end
			end
		end
	end
	def write_my_file(time, word)
		final_string = "#{word.upcase}: #{time}"
		# File.open("potential_typos.txt", 'a') do |file|
		#     file.puts final_string
	 #  	end
		IO.write("potential_typos.txt", final_string, 30)
	end
end


# FILES
subtitle_file = Srt.new("ress.srt")
dictionary_file = "/usr/share/dict/words"

subtitle_file.split_into_elements(3500)

typo = Typos.new(subtitle_file, dictionary_file)

p typo.check