module LinkedRef
	Struct.new("Node", :value, :next, :prev)
	
	class LinkedList
		attr_reader :size
		include Enumerable
		def initialize()
			@head = nil
			@tail = nil
			@size = 0
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
			@size+=1
		end
		def insert_end(val)
			if @head.nil?
				@head = Struct::Node.new(val, nil, nil)
				@tail = @head
			else
				@tail[:next] = Struct::Node.new(val, nil, @tail)
				@tail = @tail[:next]
			end
			@size+=1
		end
		def extract_beg()
			if @head.nil?
				raise RuntimeError, "List is empty, you can't extract"
			end
			if @head == @tail
				@head, @tail = nil
			else
				@head = @head[:next]
				@head[:prev] = nil
			end
			@size-=1
		end
		def extract_end()
			if @head.nil?
				raise RuntimeError, "List is empty, you can't extract"
			end
			if @head == @tail
				@head, @tail = nil
			else
				@tail = @tail[:prev]
				@tail[:next] = nil
			end
			@size-=1
		end
		def [](index)
			if !index.between?(0, size)
				raise RuntimeError, "Bad index"
			end
			if(index < size/2)
				# Llegamos antes mirando desde la cabeza
				iterator = @head
				while (!iterator.nil? && index != 0)
					iterator = iterator[:next]
					index-=1
				end
			else
				# Llegamos antes mirando desde la cola
				iterator = @tail
				index = size-index-1
				while (!iterator.nil? && index != 0)
					iterator = iterator[:prev]
					index-=1
				end
			end
			return iterator[:value]
		end
		def each(&block) #El enum ya está listo
			iterator = @head
			while !iterator.nil?
				block.call(iterator[:value])
				iterator = iterator[:next]
			end
		end
	end
end