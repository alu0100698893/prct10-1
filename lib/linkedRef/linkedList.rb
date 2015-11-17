module LinkedRef
	Struct.new("Node", :value, :next, :last)
	
	class LinkedList
		def initialize()
			@head = nil
			@tail = nil
		end
	end
end