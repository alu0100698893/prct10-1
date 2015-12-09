require 'linkedRef/documentoElectronico'
require 'linkedRef/periodico'
require 'linkedRef/articulo'
require 'linkedRef/libro'

module LinkedRef
	class ConjuntoRef
		include Enumerable
		def initialize()
			@lista = LinkedRef::LinkedList.new
		end
		def insertar(referencia)
			raise ArgumentError, "La referencia no es de tipo referencia" unless referencia.kind_of?(LinkedRef::Referencia)
			@lista.insert_end(referencia)
			@lista.sort!
		end
		def each
			@lista.each{ |i| yield i}
		end
		def to_s
			string = ""
			@lista.each do |i|
				string << i.to_s
				string << "\n"
			end
			return string
		end
	end
end