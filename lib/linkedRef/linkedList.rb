module LinkedRef
	Struct.new("Node", :value, :next, :last)
	
	class LinkedList
		def initialize()
			@head = nil
			@tail = nil
		end
		def to_s
			return "[]"
		end
	end
end