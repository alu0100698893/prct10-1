module LinkedRef
	Struct.new("Node", :value, :next, :prev)
	
	class LinkedList
		def initialize()
			@head = nil
			@tail = nil
		end
		def to_s
			iterator = @head
			string = "["
				while !iterator.nil?
					string << iterator[:value].to_s
					string << ", " unless iterator[:next] == nil
					iterator = iterator[:next]
				end
			string << "]"
			return string
		end
		def insert_beg(val)
			if @head.nil?
				@head = Struct::Node.new(val, nil, nil)
				@tail = @head
			else
				@head[:prev] = Struct::Node.new(val, @head, nil)
				@head = @head[:prev]
			end
		end
		def insert_end(val)
			if @head.nil?
				@head = Struct::Node.new(val, nil, nil)
				@tail = @head
			else
				@tail[:next] = Struct::Node.new(val, nil, @tail)
				@tail = @tail[:next]
			end
		end
	end
end