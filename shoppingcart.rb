class ShoppingCart
	def initialize
		puts @items = {
			apples: 10,
			oranges: 5,
			grapes: 15,
			banana: 20,
			watermelon: 50
		}
	end
	def add
		@items.each do |item, price|
			
		end
	end
	def total
		
	end
end

class Item
	def initialize(item, price)
		@item = item
		@price = price
	end
end

cart = ShoppingCart.new
cart.add_item("banana", 10)
puts cart.add