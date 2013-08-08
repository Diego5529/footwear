class Cart
	attr_reader :items

	def initialize
		@items = []
	end

	def <<(product)
		@items << product if !@items.include?(product)
	end

	def -(product)
		@items.delete(product)
	end

	def total
		@items.inject(0) {|m,i| m += i.value}
	end

	


	def clear
		@items = []
	end
end