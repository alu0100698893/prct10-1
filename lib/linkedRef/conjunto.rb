require 'linkedRef/documentoElectronico'
require 'linkedRef/periodico'
require 'linkedRef/articulo'
require 'linkedRef/libro'

module LinkedRef
	class ConjuntoRef
		def initialize()
			@lista = LinkedRef::LinkedList.new
		end
		def insertar(referencia)
			@lista.insert_end(referencia)
			@lista.sort!
		end
		def to_s()
			@lista.each{ |i| puts i}
		end
	end
end