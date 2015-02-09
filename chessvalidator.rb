require 'pp'

class Movement
	def initialize(file)
		@all_moves = file.split("\n").map {|move| move.split(" ")}
	end
	def generate_starting_coordinates
		@all_moves.map do |move|
			[move[0][0].ord - 96, move[0][1].to_i]
		end
	end
	
	def generate_target_coordinates
		@all_moves.map do |move|
			[move[1][0].ord - 96, move[1][1].to_i]
		end
	end
	
end

class Rook

	def initialize(start, target)
		@horizontal = start
		@vertical = start
		@target_h = target
		@target_v = target
	end

	def check_valid

		if @horizontal != @target_h && @vertical != @target_v
			"ILLEGAL"
		else
			"LEGAL"
		end
	end

end
movement = Movement.new(IO.read("chesscommands.txt"))
move_1_start = movement.generate_starting_coordinates
move_1_target = movement.generate_target_coordinates
move_1 = Rook.new(move_1_start, move_1_target)
pp move_1.check_valid