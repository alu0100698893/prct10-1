require 'linkedRef/referencia'

module LinkedRef
	class Libro < Referencia
		def initialize(autores, titulo, fecha, editorial, edicion = nil)
			super(autores, titulo, fecha)
			@editorial = editorial
			@edicion = edicion
		end
	end
end