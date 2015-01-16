require 'pp'

class Rook

	def initialize(horizontal,vertical)
		@horizontal = horizontal
		@vertical = vertical
	end

	def check_valid(target_h, target_v)
		@target_h = target_h
		@target_v = target_v

		hor_posibiity && ver_posibility

		if @horizontal != @target_h && @vertical != @target_v
			"Illegal"
		else
			"Legal"
		end
	end
	
	private
	def hor_posibiity
		@horizontal > 1 && @horizontal < 8
	end

	def ver_posibility
		@vertical > 1 && @vertical < 8
	end
end

move_1 = Rook.new(1, 1)
pp move_1.check_valid(1, 8)